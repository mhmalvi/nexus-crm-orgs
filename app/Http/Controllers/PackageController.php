<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\Package;
use App\Models\PackageSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\Stmt\TryCatch;
use Throwable;

class PackageController extends Controller
{

    /**
     * 
     * 
     *  get the resources 
     * 
     * 
     */
    public function getPackage()
    {

        //get all packages
        $packages = Package::all();

        return response()->json([

            'packages' => $packages

        ]);
    }
    /**
     * check package limit for adding sales team new member
     *
     * @return \Illuminate\Http\Response
     */
    public function checkPackageLimit()
    {

        try {
            //code...
            //this data comes from api with client http request now i am using dummy data
            $get_response = [
                'current_member' => 19,
                'email' => 'dummymember@gmail.com',
                'company_id' => 3,
            ];

            $get_response = json_encode($get_response);
            $get_response = json_decode($get_response);

            //get the subscription id
            $company = Company::select('subscription_id')->where('id', $get_response->company_id)->first();

            //get the packages according to subscription
            $packages = PackageSubscription::select('package_id')->where('subscription_id', $company->subscription_id)->get();

            //check is any sales team member could be added
            foreach ($packages as $item) {

                $package = Package::select('package_type', 'package_type_limit')->where('id', $item->package_id)->first();
                $package_type =  $package->package_type;
                //package type 1 means user type package
                if ($package_type == 1) {

                    $package_limit = $package->package_type_limit;

                    if ($get_response->current_member < $package_limit) {
                        //here call a client http post request and get a status
                        $status = 201;

                        if ($status == 201) {

                            return response()->json([
                                'key' => 'success',
                                'message' => 'Your requested member has been added'
                            ], 201);
                        }
                    } else {
                        return response()->json([
                            'key' => 'fail',
                            'message' => 'Package Member limitation is full.'
                        ], 406);
                    }
                } else {
                    return response()->json([
                        'key' => 'not found',
                        'message' => 'You are not subscribed for user package'
                    ], 404);
                }
            }
        } catch (\Throwable $th) {
            return response()->json([
                'error' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //valiadtion of input data
        $request->validate([

            'package_name' => 'required',
            'package_type' => 'required|unique:packages', //pacakge type = 1 means user type package, package type = 2 means time limitation package ,  package type = 3 means storage limitation package 
            'package_type_limit' => 'required',
            'business_type' => 'required',
            'package_details' => 'required',

        ]);

        try {
            //insert all data in database
            $create = Package::create([
                'package_name' => $request->package_name,
                'package_type' => $request->package_type,
                'business_type' => $request->business_type,
                'package_details' => $request->package_details,
                'package_type_limit' => $request->package_type_limit,
            ]);

            //send response
            if ($create) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Package has been created successfully'
                ], 201);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package create Fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Package $package)
    {
        //valiadtion of input data
        $request->validate([

            'package_name' => 'required',
            'package_type_limit' => 'required',
            'business_type' => 'required',
            'package_details' => 'required',

        ]);

        try {
            //insert all data in database
            $update = Package::where('id', $request->id)->update([
                'package_name' => $request->package_name,
                'business_type' => $request->business_type,
                'package_type_limit' => $request->package_type_limit,
                'package_details' => $request->package_details,

            ]);
            //send response
            if ($update) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Package has been update successfully'
                ], 201);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package update Fail'
                ], 406);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function destroy(Package $package, $id, $user_id)
    {
        try {
            //delete the company 
            $delete = DB::table('packages')->where('id', $id)
                ->update(
                    [
                        'active' => 0,
                        'deleted_by' => $user_id
                    ]
                );

            //send the response
            if ($delete) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Package has been soft deleted successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package soft delete fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Package;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Throwable;

class PackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            'package_type' => 'required|unique:packages',
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
     * Display the specified resource.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function show(Package $package)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function edit(Package $package)
    {
        //
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
                ], 404);
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
    public function destroy(Package $package, $id)
    {
        try {

            //delete the sales team 
            $delete =  DB::table('packages')->where('id', $id)->delete();

            //send the response
            return response()->json([

                'key' => 'success',
                'message' => ' Package has been deleted successfully'

            ], 200);
        } catch (Throwable $e) {

            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

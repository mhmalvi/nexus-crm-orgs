<?php

namespace App\Http\Controllers;

use App\Models\PackageSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Throwable;

class PackageSubscriptionController extends Controller
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
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {

        //valiadtion of input data
        $request->validate([

            'package_id' => 'required',
            'status' => 'required',
            'subscription_id' => 'required',


        ]);

        try {
            //insert all data in database
            $create = PackageSubscription::create([
                'package_id' => $request->package_id,
                'status' => $request->status,
                'subscription_id' => $request->subscription_id,

            ]);

            //send response
            if ($create) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Package Subscription has been created successfully'
                ], 201);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package Subscription create Fail'
                ], 406);
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
     * @param  \App\Models\PackageSubscription  $packageSubscription
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, PackageSubscription $packageSubscription)
    {

        //valiadtion of input data
        $request->validate([

            'package_id' => 'required',
            'status' => 'required',
            'subscription_id' => 'required',


        ]);

        try {
            //insert all data in database
            $update = PackageSubscription::where('id', $request->id)->update([
                'package_id' => $request->package_id,
                'status' => $request->status,
                'subscription_id' => $request->subscription_id,

            ]);

            //send response
            if ($update) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Package Subscription has been updated successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package Subscription update Fail'
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
     * @param  \App\Models\PackageSubscription  $packageSubscription
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(PackageSubscription $packageSubscription, $id, $user_id)
    {
        try {
            //delete the company
            $delete = DB::table('package_subscriptions')->where('id', $id)
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
                    'message' => 'Package subscriptions has been soft deleted successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Package subscriptions soft delete fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

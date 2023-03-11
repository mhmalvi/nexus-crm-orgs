<?php

namespace App\Http\Controllers;

use Throwable;
use App\Models\Subscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubscriptionController extends Controller
{
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

            'subscription_name' => 'required',
            'discounted' => 'required',
            'total' => 'required',
            'status' => 'required',

        ]);

        try {
            //insert all data in database
            $create = Subscription::create([
                'subscription_name' => $request->subscription_name,
                'discount_type' => $request->discount_type,
                'discount_amount' => $request->discount_amount,
                'discounted' => $request->discounted,
                'total' => $request->total,
                'status' => $request->status,
            ]);

            //send response
            if ($create) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Subscription has been created successfully'
                ], 201);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Subscription create Fail'
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
     * @param  \App\Models\Subscription  $subscription
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Subscription $subscription)
    {
        //get the all subscription
        $subscription = Subscription::all();

        //$subscription = Subscription::where('active', 1)->get();

        //send a json object of subscription
        return response()->json($subscription, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Subscription  $subscription
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Subscription $subscription)
    {
        //valiadtion of input data
        $request->validate([

            'subscription_name' => 'required',
            'discounted' => 'required',
            'total' => 'required',
            'status' => 'required',

        ]);

        try {
            //update all data in database
            $update = Subscription::where('id', $request->id)
                ->update([
                    'subscription_name' => $request->subscription_name,
                    'discount_type' => $request->discount_type,
                    'discount_amount' => $request->discount_amount,
                    'discounted' => $request->discounted,
                    'total' => $request->total,
                    'status' => $request->status,
                ]);

            //send response
            if ($update) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Subscription has been updated successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Subscription update Fail'
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
     * @param  \App\Models\Subscription  $subscription
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Subscription $subscription, $id, $user_id)
    {
        try {
            //delete the company
            $delete = DB::table('subscriptions')->where('id', $id)
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
                    'message' => 'Subscription has been soft deleted successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Subscription soft delete fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

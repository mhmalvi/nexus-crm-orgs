<?php

namespace App\Http\Controllers;

use App\Models\Requisition;
use Illuminate\Http\Request;
use Throwable;

class RequisitionController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        //dd($request);
        if(!isset($request->email) || !isset($request->company_name) || !isset($request->packages_id) || !isset($request->business_email) || !isset($request->contact))
            return response()->json([
                'status' => false,
                'message' => 'Company Name, packages_id, Email and Personal information required',
            ], 401);
        $existData = Requisition::where('email', $request->email)->first();
        if($existData!=""){
            return response()->json([
                'status' => false,
                'message' => 'Email Address Exist',
            ], 401);
        }
        try {
            //insert all data in database
            $create = Requisition::updateOrcreate([
                'name' => $request->name,
                'email' => $request->email,
                'packages_id' => $request->packages_id,
                'contact' => $request->contact,
                'description' => isset($request->description)?$request->description:'',
                'logo' => isset($request->logo_id)?$request->logo_id:'',
                'business_email' => isset($request->business_email)?$request->business_email:'',
                'address' => isset($request->address)?$request->address:'',
                'abn' => isset($request->abn)?$request->abn:'',
                'website' => isset($request->website)?$request->website:'',
                'trading_name' => isset($request->trading_name)?$request->trading_name:'',
                'rto_code' => isset($request->rto_code)?$request->rto_code:'',
                'country_name' => isset($request->country_name)?$request->country_name:'',
                'company_name' => isset($request->company_name)?$request->company_name:''
            ]);

            //send response
            if ($create) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Successfully data inserted'
                ], 201);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Fail data insert'
                ], 404);
            }
        } catch (Throwable $e) {

            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Update the the status of requition
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Requisition  $requisition
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateRequisition(Request $request, Requisition $requisition)
    {
        //validation the status
        $request->validate([
            'status' => 'required'
        ]);
        try {
            //update the status
            $update = Requisition::where('id', $request->id)
                ->update([

                    'status' => $request->status
                ]);


            //after updated  send the request
            if ($update) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Successfully status updated'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Fail status update '
                ], 404);
            }
        } catch (\Throwable $th) {

            return response()->json([
                'key' => 'error',
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Get Requisition List
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRequisitionList(Request $request)
    {
        try {
            $coursesList = Requisition::select('*');
            //$coursesList =$coursesList->where('status',1);
            $coursesList = $coursesList->orderBy('id', 'desc')->get();
            // dd($leadCheckList);
            if($coursesList==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Requisition not found',
                ], 401);
            }

            return response()->json([
                'status' => true,
                'message' => 'All Requisition',
                'data'    => $coursesList->toArray()
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}

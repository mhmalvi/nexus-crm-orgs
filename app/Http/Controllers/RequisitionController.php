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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //validation for all input
        $request->validate([

            'name' => 'required',
            'role_id' => 'required',
            'status' => 'required',
            'contact' => 'required',
            'business_email' => 'required',
            'website' => 'required',
            'fb_ac_credential' => 'required',
            'secret_key' => 'required',

        ]);

        try {
            // save the logo in destination folder
            $filename = '';
            if ($request->file('logo')) {
                $file = $request->logo;
                $filename = time() . '.' . $file->getClientOriginalExtension();
                $path = public_path('assets/img/logo');
                $file->move($path, $filename);
            }
            //insert all data in database
            $create = Requisition::create([
                'name' => $request->name,
                'email' => $request->email,
                'role_id' => $request->role_id,
                'status' => $request->status,
                'contact' => $request->contact,
                'description' => $request->description,
                'logo' => empty($filename) ? '' : $filename,
                'business_email' => $request->business_email,
                'address' => $request->address,
                'abn' => $request->abn,
                'website' => $request->website,
                'trading_name' => $request->trading_name,
                'rto_code' => $request->rto_code,
                'country_name' => $request->country_name,
                'fb_ac_credential' => $request->fb_ac_credential,
                'secret_key' => $request->secret_key,
                'form' => $request->form,
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
     * @return \Illuminate\Http\Response
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
                ], 200);
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
}

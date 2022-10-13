<?php

namespace App\Http\Controllers;

use App\Models\CompanyNotice;
use Illuminate\Http\Request;

class NoticeController extends Controller
{
    /**
     * Notice List
     * @param Request $request
     * @return boolean
     */
    public function index(Request $request)
    {
        if(!isset($request->client_id))
            return response()->json([
                'status' => false,
                'message' => 'Client Id not found',
            ], 401);

        //dd($request->id);
        try {
            $companyNotice = CompanyNotice::select('*');
            $companyNotice =$companyNotice->where('client_id',$request->client_id);
            $companyNotice =$companyNotice->where('status',1);
            $companyNotice = $companyNotice->get();
            // dd($leadCheckList);
            if($companyNotice==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Notice not found',
                ], 401);
            }

            return response()->json([
                'status' => true,
                'message' => 'All Notice',
                'data'    => $companyNotice->toArray()
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Create Notice
     * @param Request $request
     * @return Payment Setting
     */
    public function create(Request $request)
    {
        if(!isset($request->client_id))
            return response()->json([
                'status' => false,
                'message' => 'Client Id required',
            ], 401);

        try {

            $data = CompanyNotice::updateOrcreate([
                'client_id' => $request->client_id,
                'notice_title' => $request->notice_title,
                'notice_description' => $request->notice_description
            ])->toArray();

            return response()->json([
                'status' => true,
                'message' => 'Notice Created Successfully',
                'data'  => $data
            ], 201);

        } catch (\Throwable $th) {

            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Update Notice
     * @param Request $request
     * @return boolean
     */
    public function update(Request $request)
    {
        if(!isset($request->id))
            return response()->json([
                'status' => false,
                'message' => 'Id not found',
            ], 401);

        try {
            $companyNotice = CompanyNotice::find($request->id)->first();
            if($companyNotice==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Notice Data not found',
                ], 401);
            }
            if(isset($request->notice_title))
                $companyNotice->notice_title = $request->notice_title;
            if(isset($request->notice_description))
                $companyNotice->notice_description = $request->notice_description;
            $companyNotice->save();
            return response()->json([
                'status' => true,
                'message' => 'Notice Update Successfully',
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Soft Delete Notice
     * @param Request $request
     * @return boolean
     */
    public function delete(Request $request)
    {
        if(!isset($request->id))
            return response()->json([
                'status' => false,
                'message' => 'Id not found',
            ], 401);

        //dd($request->id);
        try {
            $leadCheckList = CompanyNotice::find($request->id)->first();
            if($leadCheckList==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Notice not found',
                ], 401);
            }

            $leadCheckList->status = 0;
            $leadCheckList->save();
            return response()->json([
                'status' => true,
                'message' => 'Notice Delete Successfully',
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }
}

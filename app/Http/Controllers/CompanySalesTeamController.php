<?php

namespace App\Http\Controllers;

use App\Models\CompanySalesEmployee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Throwable;

class CompanySalesTeamController extends Controller
{
    /**
     * Company Employee List
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        if(!isset($request->company_id))
            return response()->json([
                'status' => false,
                'message' => 'Company Id not found',
            ], 401);

        //dd($request->id);
        try {
            $companyEmployee = CompanySalesEmployee::select('*');
            $companyEmployee =$companyEmployee->where('company_id',$request->company_id);
            $companyEmployee = $companyEmployee->get();
             //dd($companyEmployee);
            if($companyEmployee==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Sales Employee not found',
                ], 401);
            }

            $salesUserIds = [];
            foreach ($companyEmployee->toArray() as $value){
                $salesUserIds[]=$value['user_id'];
            }
            //dd(json_encode($salesUserIds));
            $userServiceAPI = env('USER_SERVICE_API', '');
            //dd($userServiceAPI);

            $response = Http::post($userServiceAPI.'/user/list', [
                'users' => json_encode($salesUserIds)
            ]);

            if(json_decode($response->body())==""){
                return response()->json([
                    'status' => false,
                    'message' => 'User Data not found',
                ], 401);
            }

            //dd(json_decode($response->body()));

            return response()->json([
                'status' => true,
                'message' => 'All Sales Employee',
                'data'    => isset(json_decode($response->body())->data)?json_decode($response->body())->data:''
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Create Sales Employee
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse Employee
     */
    public function create(Request $request)
    {

        if(!isset($request->company_id) || !isset($request->user_id))
            return response()->json([
                'status' => false,
                'message' => 'Company Id and User Id required',
            ], 401);

        try {

            CompanySalesEmployee::updateOrcreate([
                'company_id' => $request->company_id,
                'user_id' => $request->user_id
            ])->toArray();

            return response()->json([
                'status' => true,
                'message' => 'Company Employee Created Successfully'
            ], 201);

        } catch (\Throwable $th) {

            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     *
     * update sales team
     *
     */
    public function update(Request $request)
    {
        //validation
        $request->validate([

            'user_id' => 'required',
            'company_id' => 'required'

        ]);

        try {
            //update the company sales team table
            $update = DB::table('company_sales_employee')->where('company_id', $request->company_id)
                ->update([

                    'user_id' => $request->user_id,
                ]);

            if ($update > 0) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'successfully user id updated'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'fail user id updated'
                ], 304);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'error' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\Response
     */

    public function destroy($id, $user_id)
    {

        try {
            //delete the company
            $delete = DB::table('company_sales_employee')->where('id', $id)
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
                    'message' => 'Company Sales Team has been soft deleted successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Company Sales Team soft delete fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

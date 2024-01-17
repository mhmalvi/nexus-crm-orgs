<?php

namespace App\Http\Controllers;

use App\Models\CompanySalesEmployee;
use App\Models\Company;
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

    public function suspend_sales(Request $request)
    {
        $sales = CompanySalesEmployee::where('user_id', $request->user_id)->first();
        if ($request->status == 0) {
            $sales->active = 1;
            $sales->save();
        } else {
            $sales->active = 0;
            $sales->save();
        }
    }

    public function sales_list(Request $request)
    {
        if ($request->bearerToken()) {
            
            $flag = Http::timeout(10)->post('https://crmcompany.queleadscrm.com/api/check-if-token-exists')->withToken($request->bearerToken());
            $flag_receive = $flag['data'];
            if ($flag_receive == 1) {
                $company_employee = CompanySalesEmployee::where('active', 1)->get();
                $salesUserIds = [];
                foreach ($company_employee->toArray() as $value) {
                    $salesUserIds[] = $value['user_id'];
                }
                if (count($salesUserIds) > 0) {
                    if (!isset($salesUserIds)) {
                        return response()->json([
                            'status' => false,
                            'message' => 'User id required'
                        ], 406);
                    }
                    $data = DB::connection('user')->table('users')->leftJoin('user_profile', function ($join) {
                        $join->on('user_profile.user_id', '=', 'users.id');
                    })->whereIn('users.id', $salesUserIds)
                        ->where('users.status', 1)->where('role_id', 5)
                        ->get();
                    if (isset($data)) {
                        return response()->json([
                            'status' => 200,
                            'message' => 'All Sales Employee',
                            'data'    => $data
                        ], 200);
                    }
                }
            } else {
                return response()->json([
                    'message' => 'Unauthenticated',
                    'status' => 401
                ], 401);
            }
        } else {
            return response()->json([
                'message' => 'Unauthenticated',
                'status' => 401
            ], 401);
        }
    }
    public function index(Request $request)
    {
        if ($request->bearerToken()) {
            $userApi = env('USER_SERVICE_API', '');
            $flag = Http::withToken($request->bearerToken())->post($userApi . '/check-if-token-exists');
            $flag_receive = $flag['data'];
            if ($flag_receive == 1) {
                if (!isset($request->company_id))
                    return response()->json([
                        'status' => false,
                        'message' => 'Company Id not found',
                    ], 401);

                //dd($request->id);
                // try {
                $companyEmployee = CompanySalesEmployee::select('*');
                // if()
                $companyEmployee = $companyEmployee->where('active', 1);
                $companyEmployee = $companyEmployee->get();
                //dd($companyEmployee);
                if ($companyEmployee == "") {
                    return response()->json([
                        'status' => false,
                        'message' => 'Sales Employee not found',
                    ], 401);
                }

                $salesUserIds = [];
                foreach ($companyEmployee->toArray() as $value) {
                    $salesUserIds[] = $value['user_id'];
                }
                //dd(json_encode($salesUserIds));
                $userServiceAPI = env('USER_SERVICE_API', '');
                //dd($userServiceAPI);

                $response = Http::post($userServiceAPI . '/user/list', [
                    'users' => json_encode($salesUserIds)
                ]);
                // dd(json_decode($response->body()));
                // dd(json_decode($response->body()));

                if ($response->status() != '200') {
                    return response()->json([
                        'status' => false,
                        'message' => 'User Data not found',
                    ], 401);
                }

                //dd(json_decode($response->body()));

                return response()->json([
                    'status' => true,
                    'message' => 'All Sales Employee',
                    'data'    => isset(json_decode($response->body())->data) ? json_decode($response->body())->data : ''
                ], 201);

                // } catch (\Throwable $th) {
                //     return response()->json([
                //         'status' => false,
                //         'message' => $th->getMessage()
                //     ], 500);
                // }
            } else {
                return response()->json([
                    'message' => 'Unauthenticated',
                    'status' => 401
                ], 401);
            }
        } else {
            return response()->json([
                'message' => 'Unauthenticated',
                'status' => 401
            ], 401);
        }
    }

    public function company_list(Request $request, $role_id)
    {
        if ($request->bearerToken()) {
            $userApi = env('USER_SERVICE_API', '');
            $flag = Http::withToken($request->bearerToken())->post($userApi . '/check-if-token-exists');
            $flag_receive = $flag['data'];
            if ($flag_receive == 1) {
                if ($role_id == 5) {
                    $companies = Company::where('id', '!=', 25)->where('active', 1)->get();
                    if ($companies) {
                        return response()->json([
                            'message'    => 'success',
                            'status' => 200,
                            'data' => $companies
                        ], 200);
                    } else {
                        return response()->json([
                            'message'    => 'failed',
                            'status' => 500
                        ], 500);
                    }
                }
            } else {
                return response()->json([
                    'message' => 'Unauthenticated',
                    'status' => 401
                ], 401);
            }
        } else {
            return response()->json([
                'message' => 'Unauthenticated',
                'status' => 401
            ], 401);
        }
    }

    public function sales_employee_list($id)
    {
        $sales_list = CompanySalesEmployee::where('company_id', $id)->where('active', 1)->get();
        // dd(json_encode($sales_list));
        for ($i = 0; $i < count($sales_list); $i++) {
        }
        if ($sales_list) {
            return response()->json($sales_list);
        }
    }

    /**
     * Create Sales Employee
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse Employee
     */
    public function create(Request $request)
    {

        if (!isset($request->company_id) || !isset($request->user_id))
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
     * @return \Illuminate\Http\JsonResponse
     */

    public function destroy($id, $user_id)
    {

        try {
            // dd($id);
            //delete the company
            $data = DB::table('company_sales_employee')->where('id', $id)->first();
            // $delete->active = 0;
            // $delete->deleted_by = $user_id;
            // $response = $delete->save();
            $delete = DB::table('company_sales_employee')->where('id', $id)
                ->update(
                    [
                        'active' => 0,
                        'deleted_by' => $user_id
                    ]
                );
            // dd($delete);
            Http::post(env('USER_SERVICE_API', '') . '/user/delete-user', ['user_id' => $data->user_id]);

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

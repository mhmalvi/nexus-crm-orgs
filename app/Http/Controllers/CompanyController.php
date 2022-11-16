<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\CompanySalesEmployee;
use App\Models\CompanySubscription;
use Carbon\Carbon;
use Illuminate\Database\DBAL\TimestampType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use PhpParser\Node\Stmt\TryCatch;
use Throwable;
use Illuminate\Support\Facades\DB;

class CompanyController extends Controller
{
    /**
     * Company List
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCompanyList(Request $request)
    {
        try {
            $companyList = Company::select('*');
            if(isset($request->id))
                $companyList =$companyList->where('id',$request->id);
            //$companyList =$companyList->where('active',1);
            $companyList = $companyList->get();
            // dd($companyList);
            if($companyList==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Company not found',
                ], 401);
            }

            return response()->json([
                'status' => true,
                'message' => 'All Company',
                'data'    => $companyList->toArray()
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
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        //validation for all input
        $request->validate([
            'name' => 'required',
            'contact' => 'required',
            'business_email' => 'required',
            'admin' => 'required|unique:companies',
            'subscription_id' => 'required',
            'business_type' => 'required',
        ]);
        DB::beginTransaction();
        try {

            //insert all data in database
            $company = Company::updateOrcreate([
                'name' => $request->name,
                'description' => $request->description,
                'logo_id' => isset($request->logo_id)?$request->logo_id:'',
                'contact' => $request->contact,
                'business_email' => $request->business_email,
                'address' => isset($request->address)?$request->address:'',
                'abn' => isset($request->abn)?$request->abn:'',
                'website' => isset($request->website)?$request->website:'',
                'trading_name' => isset($request->trading_name)?$request->trading_name:'',
                'rto_code' => isset($request->rto_code)?$request->rto_code:'',
                'country_name' => isset($request->country_name)?$request->country_name:'',
                'admin' =>  isset($request->admin)?$request->admin:0,
                'super_admin' =>  isset($request->superAdmin)?$request->superAdmin:0,
                'app_id' => isset($request->app_id)?$request->app_id:'',
                'fb_ac_credential' => isset($request->fb_ac_credential)?$request->fb_ac_credential:'',
                'secret_key' => isset($request->secret_key)?$request->secret_key:'',
                'business_type' => isset($request->business_type)?$request->business_type:1
            ]);

            CompanySubscription::updateOrcreate([
                'company_id' => $company->id,
                'subscription_id' => isset($request->subscription_id)?$request->subscription_id:0,
                'active' => 1
            ]);

            CompanySalesEmployee::updateOrcreate([
                'company_id' => $company->id,
                'user_id' => isset($request->admin)?$request->admin:0
            ])->toArray();
            DB::commit();
            //create a company subscription row according to company id, initially it must be null
            /*    DB::table('com_subscription')->insert([
                'company_id' => $company_id,
                'subscription_id' => $request->com_subscriptions,
                'created_at' => date("Y-m-d", time()),
                'updated_at' => date("Y-m-d", time()),

            ]); */

            //sent the json response
            return response()->json([
                'key' => 'success',
                'message' => 'Company has been created successfully'
            ], 201);
        } catch (Throwable $e) {
            //send error response
            DB::rollback();
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, Company $company)
    {

        if(!isset($request->id))
            return response()->json([
                'status' => false,
                'message' => 'Id not found',
            ], 401);

        try {

            $filename = '';

            //insert all data in database
            $company = Company::where('id', $request->id)
                ->update([
                    'name' => $request->name,
                    'description' => $request->description,
                    'logo_id' => $request->logo_id,
                    'contact' => $request->contact,
                    'business_email' => $request->business_email,
                    'address' => $request->address,
                    'abn' => $request->abn,
                    'website' => $request->website,
                    'trading_name' => $request->trading_name,
                    'rto_code' => $request->rto_code,
                    'country_name' => $request->country_name,
                    'app_id' => $request->app_id,
                    'fb_ac_credential' => $request->fb_ac_credential,
                    'secret_key' => $request->secret_key,
                    'form' => $request->form,
                ]);

            if ($company) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'Company has been updated successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Company create fail'
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
     * @param  \App\Models\Company  $company
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Company $company, $id, $user_id)
    {

        try {
            //delete the company
            $delete = Company::where('id', $id)
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
                    'message' => 'Company has been soft deleted successfully'
                ], 202);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'Company soft delete fail'
                ], 404);
            }
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get Company By User
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCompanyByUser(Request $request)
    {
        if(!isset($request->user_id) || !isset($request->role_id))
            return response()->json([
                'status' => false,
                'message' => 'User not found',
            ], 401);

        try {
            if($request->role_id==3){ // If Admin
                $company = Company::select('*');
                $company =$company->where('admin',$request->user_id)->where('active', 1);
                $company = $company->first();
            }else{
                $company = Company::join('company_sales_employee', function ($join) {
                    $join->on('company_sales_employee.company_id', '=', 'companies.id');
                })->where('company_sales_employee.user_id', $request->user_id)
                    //->where('companies.active', 1)
                    //->where('lead_details.client_id', '=', $request->client_id)
                ->first();
            }
            // dd($company->toArray());
            if($company==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Data not found',
                ], 401);
            }

            if($request->role_id==3){ // If Admin
                $company->company_id = $company->id;
            }
            return response()->json([
                'status' => true,
                'message' => 'Company details',
                'data'    => $company->toArray()
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Get Company By Company
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCompanyByCompanyId(Request $request)
    {
        if(!isset($request->id))
            return response()->json([
                'status' => false,
                'message' => 'Company not found',
            ], 401);

        try {

            //$company = Company::find($request->id);
            $company = Company::select('companies.id as cid',
                'companies.name as name', 'companies.description as description', 'companies.logo_id as logo_id', 'companies.contact as contact',
                'companies.business_email as business_email', 'companies.address as address', 'companies.abn as abn', 'companies.website as website',
                'companies.trading_name as trading_name', 'companies.rto_code as rto_code', 'companies.country_name as country_name', 'companies.admin as admin',
                'companies.fb_ac_credential as fb_ac_credential', 'companies.app_id as app_id', 'companies.secret_key as secret_key', 'companies.form as form',
                'companies.business_type as business_type', 'companies.active as active',
                'packages.id as pid', 'packages.package_name as package_name', 'packages.package_type as package_type', 'packages.package_type_limit as package_type_limit',
                'packages.package_details as package_details', 'packages.price as price', 'com_subscription.created_at as package_date', 'com_subscription.active as package_status')
                ->leftJoin('com_subscription', function ($join) {
                    $join->on('companies.id', '=', 'com_subscription.company_id')->where('com_subscription.active', '=', 1);
                })
                ->leftJoin('packages', function ($join) {
                    $join->on('com_subscription.subscription_id', '=', 'packages.id');
                })
                ->where('companies.id', $request->id)
                //->where('companies.active', 1)
                //->where('lead_details.client_id', '=', $request->client_id)
                ->get();

             //dd($company->toArray());
            if($company==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Data not found',
                ], 401);
            }

            return response()->json([
                'status' => true,
                'message' => 'Company details',
                'data'    => $company->toArray()
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }


    /**
     * Client FB Token update
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateTokenByCompanyId(Request $request)
    {
        if(!isset($request->id))
            return response()->json([
                'status' => false,
                'message' => 'Company not found',
            ], 401);

        try {

            $company = Company::find( $request->id);

            //dd($company->toArray());
            if($company==""){
                return response()->json([
                    'status' => false,
                    'message' => 'Data not found',
                ], 401);
            }
            $appId =  $company->app_id;
            $fbToken = $company->fb_ac_credential;
            $secretKey = $company->secret_key;

            $url = "https://graph.facebook.com/v15.0/oauth/access_token?grant_type=fb_exchange_token&client_id=".$appId."&client_secret=".$secretKey."&fb_exchange_token=".$fbToken;
            $dataArray = json_decode(file_get_contents($url), true);

            if( $dataArray!="" && count($dataArray)>0 && isset($dataArray['access_token'])){

                $company->fb_ac_credential = $dataArray['access_token'];
                $company->save();
                //dd($dataArray['access_token']);
//                $company = Company::where('id', $request->id)
//                    ->update([
//                        'fb_ac_credential' => $dataArray['access_token']
//                    ]);
            }

            return response()->json([
                'status' => true,
                'message' => 'Company Token Update Successfully',
                'data'    => $company->toArray()
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Company Change Status for Active or Inactive
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function companyStatus(Request $request)
    {
        if(!isset($request->company_id) || !isset($request->active))
            return response()->json([
                'status' => false,
                'message' => 'Company Id not found',
            ], 401);

        //dd($request->id);
        try {

            $companies = Company::find($request->company_id);
            $companies->active = $request->active;
            $companies->save();

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
            $temp=[];
            foreach ($companyEmployee->toArray() as $value){
                $salesUserIds[]['id']=$value['user_id'];
            }
            //array_push($salesUserIds, $temp);
            //dd(json_encode($salesUserIds));

            $userServiceAPI = env('USER_SERVICE_API', '');
            //dd(json_encode($salesUserIds));
            $suspend  = ($request->active==1)?0:1;
            $response = Http::post($userServiceAPI.'/user/suspend', [
                'users' => json_encode($salesUserIds),
                'suspend' => $suspend
            ]);
             //dd(json_decode($response->body()));
            // dd(json_decode($response->body()));

//            if($response->status()!= '201'){
//                return response()->json([
//                    'status' => false,
//                    'message' => 'User Data not found',
//                ], 401);
//            }

            //dd(json_decode($response->body()));

            return response()->json([
                'status' => true,
                'message' => 'Status Update Successfully',
                //'data'    => isset(json_decode($response->body())->data)?json_decode($response->body())->data:''
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    public function testCronJob(Request $request){

        $company = Company::select('companies.id as cid',
            'companies.name as name', 'companies.description as description', 'companies.logo_id as logo_id', 'companies.contact as contact',
            'companies.business_email as business_email', 'companies.address as address', 'companies.abn as abn', 'companies.website as website',
            'companies.trading_name as trading_name', 'companies.rto_code as rto_code', 'companies.country_name as country_name', 'companies.admin as admin',
            'companies.fb_ac_credential as fb_ac_credential', 'companies.app_id as app_id', 'companies.secret_key as secret_key', 'companies.form as form',
            'companies.business_type as business_type', 'companies.active as active',
            'packages.id as pid', 'packages.package_name as package_name', 'packages.package_type as package_type', 'packages.package_type_limit as package_type_limit',
            'packages.package_details as package_details', 'packages.price as price', 'com_subscription.created_at as package_date', 'com_subscription.active as package_status')
            ->join('com_subscription', function ($join) {
                $join->on('companies.id', '=', 'com_subscription.company_id');
            })
            ->join('packages', function ($join) {
                $join->on('com_subscription.subscription_id', '=', 'packages.id');
            })
            // Filter Time limit (Type = 2)
            ->where('packages.package_type', '=', 2)
            ///////
            ->where('com_subscription.active', '=', 1)
            ->where('companies.active', 1)
            ->get();

        $data = '';
        $subject = '';
        $remainDays = '';
        if($company!=""){

            foreach ($company as $row){
                $packageStartTime = $row->package_date;
                if($row->package_date!=""){
                    $endDate= Carbon::parse($row->package_date)->addDays($row->package_type_limit);
                    $today = Carbon::parse(now());

                     $action = $today->lte($endDate);
                    if($action){

                        $sevenDays = Carbon::parse($endDate)->addDays(-7);
                        $tenDays = Carbon::parse($endDate)->addDays(-10);
                        $twoDays = Carbon::parse($endDate)->addDays(-2);
                        //dd($sevenDays. '==>'. $tenDays. '==>' .$twoDays)->format('Y.m.d');
                        //dd($twoDays->isCurrentDay());

                        if($sevenDays->isCurrentDay() || $tenDays->isCurrentDay() || $twoDays->isCurrentDay() ){
                            if($twoDays->isCurrentDay()){
                                $subject = 'Reminder!! 2 days to go';
                                $remainDays = '2';
                            }
                            if($sevenDays->isCurrentDay()){
                                $subject = 'Reminder!! 7 to go';
                                $remainDays = '7';
                            }
                            if($tenDays->isCurrentDay()){
                                $subject = 'Reminder!! 10 to go';
                                $remainDays = '10';
                            }
                            // User Details
                            if($row->admin>0){

                                $userServiceAPI = env('USER_SERVICE_API', '');
                                //dd($userServiceAPI);
                                $response = Http::post($userServiceAPI.'/user/list', [
                                    'users' => json_encode(array($row->admin))
                                ]);

                                $userDetailsData = json_decode($response->body());
                                $userDetails= isset($userDetailsData->data[0])?$userDetailsData->data[0]:'';
                                //dd($userDetails);
                                //send response
                                if($userDetails!=""){
                                    $emailServiceAPI = env('EMAIL_SERVICE_API', '');
                                    $infoData =[
                                        'user_details' => $userDetails,
                                        'company_details' => $row,
                                        'subject'        => $subject,
                                        'remainDays'   => $remainDays
                                    ];
                                    //dd($invoiceData);
                                    $response = Http::post($emailServiceAPI.'/reminder', [
                                        'data' => json_encode($infoData)
                                    ]);
                                    //dd( json_decode($response->body()));
                                }

                            }

                          //dd($row);
                          // Email for Reminder notification
                        }
                    }
                }

                //$packageEndTime =
                //dd($packageStartTime);
            }

        }

        return response()->json([
            'status' => true,
            'message' => 'Company Token Update Successfully',
            'data'    => $company->toArray()
        ], 201);

    }

    public function testCompanyDownCronJob(Request $request){

        $company = Company::select('companies.id as cid',
            'companies.name as name', 'companies.description as description', 'companies.logo_id as logo_id', 'companies.contact as contact',
            'companies.business_email as business_email', 'companies.address as address', 'companies.abn as abn', 'companies.website as website',
            'companies.trading_name as trading_name', 'companies.rto_code as rto_code', 'companies.country_name as country_name', 'companies.admin as admin',
            'companies.fb_ac_credential as fb_ac_credential', 'companies.app_id as app_id', 'companies.secret_key as secret_key', 'companies.form as form',
            'companies.business_type as business_type', 'companies.active as active',
            'packages.id as pid', 'packages.package_name as package_name', 'packages.package_type as package_type', 'packages.package_type_limit as package_type_limit',
            'packages.package_details as package_details', 'packages.price as price', 'com_subscription.created_at as package_date', 'com_subscription.active as package_status')
            ->join('com_subscription', function ($join) {
                $join->on('companies.id', '=', 'com_subscription.company_id');
            })
            ->join('packages', function ($join) {
                $join->on('com_subscription.subscription_id', '=', 'packages.id');
            })
            // Filter Time limit (Type = 2)
            ->where('packages.package_type', '=', 2)
            ///////
            ->where('com_subscription.active', '=', 1)
            ->where('companies.active', 1)
            ->get();

        $data = '';
        $subject = '';
        $remainDays = '';
        if($company!=""){

            foreach ($company as $row){
                $packageStartTime = $row->package_date;
                if($row->package_date!=""){
                    $endDate= Carbon::parse($row->package_date)->addDays($row->package_type_limit);

                    if($endDate->isCurrentDay()){

                        //dd($row);

                        $subject = 'Subscription expiration';

                            // User Details
                            if($row->admin>0){

                                ///////////Company Inactive //

                                $companies = Company::find($row->cid);
                                $companies->active = 0;
                                $companies->save();

                                $companyEmployee = CompanySalesEmployee::select('*');
                                $companyEmployee =$companyEmployee->where('company_id',$row->cid);
                                $companyEmployee = $companyEmployee->get();
                                //dd($companyEmployee);
                                $salesUserIds = [];

                                if($companyEmployee!=""){
                                    foreach ($companyEmployee->toArray() as $value){
                                        $salesUserIds[]['id']=$value['user_id'];
                                    }
                                    $userServiceAPI = env('USER_SERVICE_API', '');
                                    //dd(json_encode($salesUserIds));
                                    $suspend  = ($request->active==1)?0:1;
                                    Http::post($userServiceAPI.'/user/suspend', [
                                        'users' => json_encode($salesUserIds),
                                        'suspend' => $suspend
                                    ]);
                                }

                                //// EOF Company Inactive

                                $userServiceAPI = env('USER_SERVICE_API', '');
                                //dd($userServiceAPI);
                                $response = Http::post($userServiceAPI.'/user/list', [
                                    'users' => json_encode(array($row->admin))
                                ]);

                                $userDetailsData = json_decode($response->body());
                                $userDetails= isset($userDetailsData->data[0])?$userDetailsData->data[0]:'';
                                //dd($userDetails);
                                //send response
                                if($userDetails!=""){
                                    $emailServiceAPI = env('EMAIL_SERVICE_API', '');
                                    $infoData =[
                                        'user_details' => $userDetails,
                                        'company_details' => $row,
                                        'subject'        => $subject
                                    ];
                                    //dd($invoiceData);
                                    $response = Http::post($emailServiceAPI.'/subscription-expired', [
                                        'data' => json_encode($infoData)
                                    ]);
                                    //dd( json_decode($response->body()));
                                }

                            }

                            //dd($row);
                            // Email for Reminder notification
                        }

                }

                //$packageEndTime =
                //dd($packageStartTime);
            }

        }

        return response()->json([
            'status' => true,
            'message' => 'Company Token Update Successfully',
            'data'    => $company->toArray()
        ], 201);

    }


//    public function cusfile(Request $request)
//    {
//
//        return $request->all();
//
//        return response()->json([
//
//            'logo_id' => 1,
//            'logo_path' => 'crm.company.com/api/update/company',
//
//        ]);
//    }
}

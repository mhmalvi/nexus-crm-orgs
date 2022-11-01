<?php

namespace App\Http\Controllers;

use App\Models\Company;
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
            $companyList =$companyList->where('active',1);
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

        try {

            //insert all data in database
            $company_id = Company::create([
                'name' => $request->name,
                'description' => $request->description,
                'logo_id' => isset($request->logo_id)?$request->logo_id:'',
                'contact' => $request->contact,
                'business_email' => $request->business_email,
                'address' => isset($request->address)?$request->address:'',
                'abn' => $request->abn,
                'website' => $request->website,
                'trading_name' => $request->trading_name,
                'rto_code' => $request->rto_code,
                'country_name' => $request->country_name,
                'admin' => $request->admin,
                'fb_ac_credential' => $request->fb_ac_credential,
                'secret_key' => $request->secret_key,
                'subscription_id' => $request->subscription_id,
                'business_type' => $request->business_type
            ]);

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
                $company =$company->where('admin',$request->user_id);
                $company = $company->first();
            }else{
                $company = Company::join('company_sales_employee', function ($join) {
                    $join->on('company_sales_employee.company_id', '=', 'companies.id');
                })->where('company_sales_employee.user_id', $request->user_id)
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
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * Get Company By Company Id
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
                'companies.fb_ac_credential as fb_ac_credential', 'companies.secret_key as secret_key', 'companies.form as form', 'companies.subscription_id as subscription_id',
                'companies.business_type as business_type', 'companies.active as active',
                'packages.id as pid', 'packages.package_name as package_name', 'packages.package_type as package_type', 'packages.package_type_limit as package_type_limit',
                'packages.package_details as package_details', 'packages.price as price')
                ->join('packages', function ($join) {
                $join->on('companies.subscription_id', '=', 'packages.id');
            })->where('companies.id', $request->id)
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
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
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

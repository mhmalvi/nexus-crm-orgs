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
     * 
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        //validation for all input
        $request->validate([
            'name' => 'required',
            'contact' => 'required',
            'business_email' => 'required',
            'website' => 'required',
            'admin' => 'required|unique:companies',
            'fb_ac_credential' => 'required',
            'secret_key' => 'required',
        ]);

        try {

            //insert all data in database
            $company_id = Company::create([
                'name' => $request->name,
                'description' => $request->description,
                'logo' => null,
                'contact' => $request->contact,
                'business_email' => $request->business_email,
                'address' => $request->address,
                'abn' => $request->abn,
                'website' => $request->website,
                'trading_name' => $request->trading_name,
                'rto_code' => $request->rto_code,
                'country_name' => $request->country_name,
                'admin' => $request->admin,
                'fb_ac_credential' => $request->fb_ac_credential,
                'secret_key' => $request->secret_key,
                'form' => $request->form,
                'subscription_id' => $request->subscription_id,
                'business_type' => $request->business_type,
                'created_at' => date("Y-m-d", time()),
                'updated_at' => date("Y-m-d", time()),
            ])->id;

            //create a company sales team row according to company id
            DB::table('com_sales_team')->insert([
                'company_id' => $company_id,
                'user_id' => $request->user_id,
                'created_at' => date("Y-m-d", time()),
                'updated_at' => date("Y-m-d", time()),
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
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Company $company)
    {

        //validation for all input
        $request->validate([]);

        try {

            $filename = '';

            //insert all data in database
            $company = Company::where('id', $request->id)
                ->update([
                    'name' => $request->name,
                    'description' => $request->description,
                    'logo' => empty($filename) ? '' : $filename,
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
     * @return \Illuminate\Http\Response
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

    public function cusfile(Request $request)
    {

        return $request->all();

        return response()->json([

            'logo_id' => 1,
            'logo_path' => 'crm.company.com/api/update/company',

        ]);
    }
}

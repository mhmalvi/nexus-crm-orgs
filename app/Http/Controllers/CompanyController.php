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

            // save the logo in destination folder
            $filename = '';
            if ($request->file('logo')) {
                $file = $request->logo;
                $filename = time() . '.' . $file->getClientOriginalExtension();
                $path = public_path('assets/img/logo');
                $file->move($path, $filename);
            }

            //insert all data in database
            $company_id = Company::create([
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
                'message' => 'Successfully data inserted'
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
        $request->validate([
            'name' => 'required',
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
                    'message' => 'Successfully data updated'
                ], 200);
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
    public function destroy(Company $company, $id)
    {
        try {
            //delete the company 
            $company = Company::find($id);
            $company->delete();

            //delete the sales team 
            DB::table('com_sales_team')->where('company_id', $id)->delete();

            //send the response
            return response()->json([
                'key' => 'success',
                'message' => 'Successfully data deleted'
            ], 200);
        } catch (Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CompanySalesTeamController extends Controller
{
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
            $update = DB::table('com_sales_team')->where('id', $request->company_id)
                ->update([

                    'user_id' => $request->user_id,
                ]);

            if ($update) {
                return response()->json([
                    'key' => 'success',
                    'message' => 'successfully user id updated'
                ], 200);
            } else {
                return response()->json([
                    'key' => 'fail',
                    'message' => 'fail user id updated'
                ], 404);
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
    public function destroy($user_id)
    {
        try {


            $delete =  DB::table('com_sales_team')->where('user_id', $user_id)->delete();

            if ($delete) {

                return response()->json([
                    'key' => 'success',
                    'message' => 'successfully data deleted'
                ], 200);
            } else {
                return response()->json([
                    'key' => 'success',
                    'message' => 'fail data deleted'
                ], 404);
            }
        } catch (\Throwable $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

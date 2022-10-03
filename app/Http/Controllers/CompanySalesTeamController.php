<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Throwable;

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
            $update = DB::table('com_sales_team')->where('company_id', $request->company_id)
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
            $delete = DB::table('com_sales_team')->where('id', $id)
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

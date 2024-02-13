<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\FileServer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FileServerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $file_server = FileServer::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $file_system = FileServer::where('user_id', $request->user_id)->where('client_id', $request->client_id)->first();
            $file_system->user_id = $request->user_id;
            $file_system->client_id = $request->client_id;
            $file_system->document_details = $request->document_details;
            if ($request->document_name) {
                $fileName = time() . '.' . $request->document_name->getClientOriginalExtension();
                $request->document_name->move(public_path('assets/fileSystem'), $fileName);
                $file_path = "assets/fileSystem/" . $fileName;
                $file_system->document_name = $file_path;
            }
            $file_system->save();
            dd($file_system);
            Company::where('id', $request->client_id)->where('admin', $request->user_id)->update(['logo_id' => $file_system->id]);
            return response()->json([
                'message' => 'success',
                'status' => 200,
                'data' => $file_system
            ], 200);
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show_logo_details($id)
    {
        // return 201;
        // dd($id);
        $logo_id = Company::find($id);
        // dd($logo_id);
        if ($logo_id->logo_id != null || $logo_id->logo_id != "") {
            $file_system = FileServer::find($logo_id->logo_id);
            // dd(json_encode($file_system));
            if ($file_system) {
                return response()->json([
                    'message' => 'success',
                    'status' => 200,
                    'data' => $file_system->toArray(),
                    'client' => $logo_id->name
                ], 200);
            } else {
                return response()->json([
                    'message' => 'Not found',
                    'status' => 404,
                ], 404);
            }
        } else if ($logo_id->id) {
            $file_system = FileServer::where('client_id', $logo_id->id)->first();
            // dd(json_encode($file_system));
            if ($file_system) {
                return response()->json([
                    'message' => 'success',
                    'status' => 200,
                    'data' => $file_system->toArray(),
                    'client' => $logo_id->name
                ], 200);
            }
        }
    }
    public function show($id)
    {
        // return 201;
        // dd($id);
        // $logo_id = Company::where('logo_id',$id)->first();
        // dd($logo_id);
        // if($logo_id->logo_id!=null || $logo_id->logo_id!=""){
        $file_system = FileServer::find($id);
        // dd(json_encode($file_system));
        if ($file_system) {
            return response()->json([
                'message' => 'success',
                'status' => 200,
                'data' => $file_system->toArray(),
            ], 200);
        } else {
            return response()->json([
                'message' => 'Not found',
                'status' => 404,
            ], 404);
        }
        // }else{
        //     return response()->json([
        //         'message' => 'Not found',
        //         'status' => 404,
        //     ],404);
        // }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $file_system = FileServer::find($id);
        if ($file_system) {
            $delete = $file_system->delete();
            if ($delete) {
                return response()->json([
                    'message' => 'deleted',
                    'status' => 200,
                    'data' => $file_system
                ]);
            }
        } else {
            return response()->json([
                'message' => 'Not found',
                'status' => 404,
                'data' => $file_system
            ]);
        }
    }
}

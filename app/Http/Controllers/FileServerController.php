<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FileServer;

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
        $file_system = new FileServer();
        $file_system->user_id = $request->user_id;
        $file_system->client_id = $request->client_id;
        $file_system->document_details = $request->document_details; 
        if ($request->document_name) {
            $fileName = time() . '.' . $request->document_name->getClientOriginalExtension();
            $request->document_name->move(public_path('assets/fileSystem'), $fileName);
            $file_path = "assets/fileSystem/" . $fileName;
            $file_system->document_name = $file_path;
            
        }
        $save = $file_system->save();
        // dd($file_system);
        if ($save) {
            return response()->json([
                'message' => 'success',
                'status' => 200,
                'data' => $file_system
            ],200);
        }else{
            return response()->json([
                'message' => 'success',
                'status' => 500,
                'data' => $fileName
            ],500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $file_system = FileServer::find($id);
        if($file_system){
            return response()->json([
                'message'=>'success',
                'status'=>200,
                'data'=> $file_system
            ],200);
        }else{
            return response()->json([
                'message' => 'Not found',
                'status' => 404,
            ],404);
        }
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
        if($file_system){
            $delete=$file_system->delete();
            if($delete){
                return response()->json([
                    'message'=>'deleted',
                    'status'=>200,
                    'data'=>$file_system
                ]);
            }
        }else{
            return response()->json([
                'message' => 'Not found',
                'status' => 404,
                'data' => $file_system
            ]);
        }
    }
}

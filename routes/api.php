<?php

use App\Http\Controllers\CompanyController;
use App\Http\Controllers\CompanySalesTeamController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PackageSubscriptionController;
use App\Http\Controllers\RequisitionController;
use App\Models\PackageSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//Company Route
Route::post('/store/company/', [CompanyController::class,  'store']);
Route::post('/update/company/', [CompanyController::class,  'update']);
Route::get('/delete/company/{id}', [CompanyController::class,  'destroy']);


//Requisition Route
Route::post('/store/requisition', [RequisitionController::class, 'store']);
Route::post('/update/status/requisition', [RequisitionController::class, 'updateRequisition']);


//Company Sales Team Route
Route::post('/update/sales/team', [CompanySalesTeamController::class, 'update']);
Route::get('/delete/sales/team/{user_id}', [CompanySalesTeamController::class, 'destroy']);


//Package Route
Route::post('store/package', [PackageController::class, 'store']);
Route::post('update/package', [PackageController::class, 'update']);
Route::get('delete/package/{id}', [PackageController::class, 'destroy']);


//Pacakge subscription script
Route::post('store/package-subscription', [PackageSubscriptionController::class, 'store']);
Route::post('update/package-subscription', [PackageSubscriptionController::class, 'update']);
Route::get('delete/package-subscription/{id}', [PackageSubscriptionController::class, 'destroy']);

<?php

use App\Http\Controllers\CompanyController;
use App\Http\Controllers\CompanySalesTeamController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PackageSubscriptionController;
use App\Http\Controllers\RequisitionController;
use App\Http\Controllers\SubscriptionController;
use App\Models\Company;
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
Route::get('/delete/company/{id}/{user_id}', [CompanyController::class,  'destroy']);


//Requisition Route
Route::post('/store/requisition', [RequisitionController::class, 'store']);
Route::post('/update/status/requisition', [RequisitionController::class, 'updateRequisition']);


//Company Sales Team Route
Route::post('/update/sales/team', [CompanySalesTeamController::class, 'update']);
Route::get('/delete/sales/team/{id}/{user_id}', [CompanySalesTeamController::class, 'destroy']);


//Package Route
Route::post('store/package', [PackageController::class, 'store']);
Route::post('update/package', [PackageController::class, 'update']);
Route::get('delete/package/{id}/{user_id}', [PackageController::class, 'destroy']);


//Pacakge subscription script
Route::post('store/package-subscription', [PackageSubscriptionController::class, 'store']);
Route::post('update/package-subscription', [PackageSubscriptionController::class, 'update']);
Route::get('delete/package-subscription/{id}/{user_id}', [PackageSubscriptionController::class, 'destroy']);


//check if a sales team member could be added or not according to package type limit
Route::get('check/package/limit', [PackageController::class, 'checkPackageLimit']);


//subscription Route
Route::get('get/subscription', [SubscriptionController::class, 'show']);
Route::post('store/subscription', [SubscriptionController::class, 'store']);
Route::post('update/subscription', [SubscriptionController::class, 'update']);
Route::get('delete/subscription/{id}/{user_id}', [SubscriptionController::class, 'destroy']);


//dummy
Route::post('/file', [CompanyController::class, 'cusfile']);

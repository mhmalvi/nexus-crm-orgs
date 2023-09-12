<?php

use App\Http\Controllers\CompanyController;
use App\Http\Controllers\CompanySalesTeamController;
use App\Http\Controllers\FileServerController;
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
Route::post('/company/create', [CompanyController::class,  'store']);
Route::get('/company/{id}/details', [CompanyController::class, 'getCompanyByCompanyId']);
Route::put('/company/update', [CompanyController::class,  'update']);
Route::get('/delete/company/{id}/{user_id}', [CompanyController::class,  'destroy']);
Route::post('/company/list', [CompanyController::class,  'getCompanyList']);
Route::post('/company/details/user', [CompanyController::class, 'getCompanyByUser']);
Route::post('/company/status', [CompanyController::class, 'companyStatus']);
Route::get('/company/{id}/token/update', [CompanyController::class,  'updateTokenByCompanyId']);

Route::get('/company/test-cron', [CompanyController::class,  'testCronJob']);
Route::get('/company/test-company-down-cron', [CompanyController::class,  'testCompanyDownCronJob']);
Route::post('/company/check-renew-verification-code', [CompanyController::class,  'checkCompanyVerificationCode']);

//Requisition Route
Route::get('/requisition/list', [RequisitionController::class, 'getRequisitionList']);
Route::post('/store/requisition', [RequisitionController::class, 'store']);
Route::post('/update/status/requisition', [RequisitionController::class, 'updateRequisition']);

Route::get('role_id={role_id}/company-list-in-sales', [CompanySalesTeamController::class, 'company_list']);

//Company Sales Team Route
Route::get('/company/{company_id}/employee/list', [CompanySalesTeamController::class,  'index']);
Route::post('/company/employee/create', [CompanySalesTeamController::class,  'create']);
Route::post('/update/sales/team', [CompanySalesTeamController::class, 'update']);
Route::get('/delete/sales/team/{id}/{user_id}', [CompanySalesTeamController::class, 'destroy']);

Route::post('/suspend-sales-in-company-sales-employee-table', [CompanySalesTeamController::class, 'suspend_sales']);


Route::get('/company/sales/{id}', [CompanySalesTeamController::class, 'sales_employee_list']);
Route::get('/sales-employee', [CompanySalesTeamController::class, 'sales_list']);

//Package Route
Route::get('get/package', [PackageController::class, 'getPackage']);
Route::get('edit/package/{id}', [PackageController::class, 'edit']);
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

//Notice Route
Route::post('notice/list', [\App\Http\Controllers\NoticeController::class, 'index']);
Route::post('notice/create', [\App\Http\Controllers\NoticeController::class, 'create']);
Route::put('notice/{id}/update', [\App\Http\Controllers\NoticeController::class, 'update']);
Route::delete('notice/{id}/delete', [\App\Http\Controllers\NoticeController::class, 'delete']);

//Company delete
Route::get('/company_id={company_id}/company-destroy', [\App\Http\Controllers\CompanyController::class, 'destroy_company']);

//dummy
Route::post('/file', [CompanyController::class, 'cusfile']);


Route::post('/documents', [FileServerController::class, 'store']);
Route::get('/documents/{id}', [FileServerController::class, 'show']);
Route::get('/documents-details/{id}', [FileServerController::class, 'show_logo_details']);
Route::get('/documents-delete/{id}', [FileServerController::class, 'destroy']);

Route::post('/get-client-name', [\App\Http\Controllers\CompanyController::class, 'college_name']);
Route::post('/send-company-abn', [CompanyController::class, 'company_id']);

Route::get('/get-company-logo/{id}', [CompanyController::class, 'company_logo']);

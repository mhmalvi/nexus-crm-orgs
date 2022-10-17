<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanySalesEmployee extends Model
{
    use HasFactory;

    protected $table ='company_sales_employee';

    protected $fillable=[
        'company_id',
        'user_id'
    ];

    protected $attributes=[
        'active'=>1
    ];
}

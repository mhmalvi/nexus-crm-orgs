<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CompanyNotice extends Model
{
    use HasFactory;

    protected $table = 'company_notice';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'client_id',
        'notice_title',
        'notice_description'
    ];

    protected $attributes = [
        'status' => 1
    ];
}

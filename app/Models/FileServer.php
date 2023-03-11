<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FileServer extends Model
{
    use HasFactory;

    protected $table = "crm_filesystem";
    protected $guarded = [];
}

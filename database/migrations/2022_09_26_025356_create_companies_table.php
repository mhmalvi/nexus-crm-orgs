<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->string('logo')->nullable();
            $table->string('contact');
            $table->string('business_email');
            $table->text('address')->nullable();
            $table->string('abn')->nullable();
            $table->string('website');
            $table->string('trading_name')->nullable();
            $table->string('rto_code')->nullable();
            $table->string('country_name')->nullable();
            $table->integer('admin');
            $table->string('fb_ac_credential');
            $table->string('secret_key');
            $table->string('form')->nullable();
            $table->string('subscription_id');
            $table->integer('business_type')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('companies');
    }
}

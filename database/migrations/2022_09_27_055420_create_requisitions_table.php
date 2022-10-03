<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisitionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisitions', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->integer('role_id');
            $table->enum('status', [0, 1])->default(0);
            $table->string('contact');
            $table->text('description');
            $table->string('logo')->nullable();
            $table->string('business_email');
            $table->text('address')->nullable();
            $table->string('abn')->nullable();
            $table->string('website');
            $table->string('trading_name')->nullable();
            $table->string('rto_code')->nullable();
            $table->string('country_name')->nullable();
            $table->string('fb_ac_credential');
            $table->string('secret_key');
            $table->string('form')->nullable();
            $table->boolean('active')->default(1);
            $table->bigInteger('deleted_by')->nullable();
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
        Schema::dropIfExists('requisitions');
    }
}

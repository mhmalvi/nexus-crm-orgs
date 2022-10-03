<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->id();
            $table->string('subscription_name')->nullable();
            $table->integer('discount_type')->nullable(); // discount_type 1 = fixed discount, 2 = percentage discount
            $table->double('discount_amount')->nullable();
            $table->boolean('discounted')->default(false);
            $table->double('total')->nullable();
            $table->boolean('status')->default(1);
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
        Schema::dropIfExists('subscriptions');
    }
}

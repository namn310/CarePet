<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('idCat');
            $table->string('name', 50);
            $table->timestamps();
        });
        Schema::create('products', function (Blueprint $table) {
            $table->increments('idPro');
            $table->string('namePro', 255);
            $table->string('description', 5000)->nullable();
            $table->integer('count', 10);
            // $table->string('image');
            $table->integer('hot', 2)->nullable();
            $table->integer('cost');
            $table->integer('discount', 5)->nullable();
            $table->timestamps();
            //foreign key categories
            $table->unsignedInteger('idCat');
            $table->foreign('idCat')->references('idCat')->on('categories')->onDelete('cascade');
        });

        Schema::create('customer', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 50);
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('phone')->nullable();
            $table->string('image')->nullable();
            $table->string('google_id')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('categories');
        Schema::dropIfExists('products');
        Schema::dropIfExists('customer');
    }
};

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
        Schema::create('bookings', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('type', 50);
            $table->string('name_service');
            $table->string('goi');
            $table->string('weight', 50);
            $table->string('date', 50);
            $table->string('note')->nullable();
            $table->integer('status')->default(0);
            $table->string('cost')->nullable();
            $table->timestamps();
            $table->unsignedBigInteger('idCus');
            $table->foreign('idCus')->references('id')->on('customer')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};

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
        Schema::create('presensi', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('pembina_id'); 
            $table->unsignedBigInteger('kegiatan_id');
            $table->date('tanggal');
            $table->foreign('pembina_id')->references('id')->on('pembina')->onDelete('cascade');
            $table->foreign('kegiatan_id')->references('id')->on('kegiatan')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('presensi');
    }
};

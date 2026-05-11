<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('adresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('nom')->nullable();
            $table->string('numero')->nullable();
            $table->string('rue');
            $table->string('ville');
            $table->string('code_postal');
            $table->string('pays')->default('France');
            $table->timestamps();
        });
    }
    public function down(): void {
        Schema::dropIfExists('adresses');
    }
};
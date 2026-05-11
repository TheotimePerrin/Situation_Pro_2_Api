<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('puzzles', function (Blueprint $table) {
            $table->id();
            $table->string('nom')->nullable();
            $table->foreignId('categorie_id')->constrained('categories')->onDelete('cascade');
            $table->string('description');
            $table->string('image');
            $table->double('prix', 8, 2);
            $table->integer('stock');
            $table->timestamps();
        });
    }
    public function down(): void {
        Schema::dropIfExists('puzzles');
    }
};
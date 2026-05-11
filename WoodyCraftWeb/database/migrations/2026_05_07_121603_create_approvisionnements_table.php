<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('approvisionnements', function (Blueprint $table) {
            $table->id();
            $table->string('nomFournisseur');
            $table->foreignId('puzzle_id')->constrained('puzzles')->onDelete('cascade');
            $table->integer('quantitee');
            $table->date('date');
        });
    }
    public function down(): void {
        Schema::dropIfExists('approvisionnements');
    }
};
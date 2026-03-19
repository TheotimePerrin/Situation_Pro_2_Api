<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PuzzleController;
use App\Http\Controllers\Api\PanierController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// ── Puzzles (existant) ──────────────────────────────────────────────────
Route::apiResource('puzzles', PuzzleController::class);

// ── Commandes / Paniers ─────────────────────────────────────────────────
Route::get('paniers',      [PanierController::class, 'index']); // liste   → Théotime
Route::get('paniers/{id}', [PanierController::class, 'show']);  // détails → Evann

// ── Auth ────────────────────────────────────────────────────────────────
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
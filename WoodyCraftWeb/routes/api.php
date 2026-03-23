<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PuzzleController;
use App\Http\Controllers\Api\StockController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::apiResource('puzzles', PuzzleController::class);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Routes dédiées au stock
Route::get('/stocks', [StockController::class, 'index']);           // pour tout voir 
Route::patch('/stocks/{id}', [StockController::class, 'update']);   // pour pouvoir modifier 
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;



///rutas con prefijo 'auth' 
Route::prefix('auth')->group(function () {
    Route::post('/register', [AuthController::class, 'register']); // si necesitas login público
    Route::post('/login', [AuthController::class, 'login']); // si necesitas login público

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/profile', [AuthController::class, 'profile']);
        Route::post('/logout', [AuthController::class, 'logout']);
    });
});
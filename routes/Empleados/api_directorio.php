<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Empleados\Directorio\ColaboradoresController;



///rutas con prefijo 'auth' 
Route::prefix('personal')->group(function () {
   
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/', [ColaboradoresController::class, 'index']);
    });
});
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Configuarcion\DepartmentsController;



///rutas con prefijo 'auth' 
Route::prefix('configuracion')->group(function () {

    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/departamentos', [DepartmentsController::class, 'index']);
        Route::post('/departamentos', [DepartmentsController::class, 'store']);
    });
});

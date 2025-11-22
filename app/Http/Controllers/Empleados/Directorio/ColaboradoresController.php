<?php

namespace App\Http\Controllers\Empleados\Directorio;

use Illuminate\Http\Request;
use App\Services\Empleados\Directorio\PersonalService;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;

class ColaboradoresController extends Controller
{
    protected  $personalService;

    public function __construct(PersonalService $personalService)
    {
        $this->personalService = $personalService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        try {
            $perPage = $request->input('per_page', 5);
            $active = $request->input('active', 1);
            $filters = [
                'estatus' => $active
            ];
            $personal = $this->personalService->listar($perPage, [$filters]);
        } catch (\Throwable $th) {
            Log::error('Error al obtener colaboradores: ' . $th->getMessage());
            return response()->json(['error' => 'Error al obtener los datos'], 500);
        }
        return response()->json(['success' => true, 'data' => $personal], 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        try {

            $data = $this->personalService->crear($request->all());
            return response()->json(['success' => true, 'data' => $data]);
        } catch (\Exception $e) {
            Log::error('Error al crear colaborador: ' . $e->getMessage());
            return response()->json(['error' => 'Error al obtener los datos'], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

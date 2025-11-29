<?php

namespace App\Http\Controllers\Configuarcion;

use App\Http\Controllers\Controller;
use App\Models\Departamento;
use Illuminate\Http\Request;
use App\Services\Configuration\Company\DepartmentsAndPositionsService;

class DepartmentsController extends Controller
{
    protected  $service;

    public function __construct(DepartmentsAndPositionsService $service)
    {
        $this->service = $service;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {


            $departments = $this->service->getAll(['puestos.personal', 'jefe', 'personal']);
            $personal = $this->service->getActiveUsers();
            return response()->json([
                'success' => true,
                'message' => 'departamentos obtenidos exitosamente.',
                'data' => $departments,
                'personal' => $personal
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los departamentos.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $data = $request->all();
            $department = $this->service->create($data);
            return response()->json([
                'success' => true,
                'message' => 'departamento creado exitosamente.',
                'data' => $department
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al crear el departamento.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Departamento $departments)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Departamento $departments)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Departamento $departments)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Departamento $departments)
    {
        //
    }
    public function getActiveUsers()
    {
        try {


            $departments = $this->service->getActiveUsers();
            return response()->json([
                'success' => true,
                'message' => 'usuarios activos obtenidos exitosamente.',
                'data' => $departments
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los departamentos activos.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}

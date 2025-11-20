<?php

namespace App\Http\Controllers;

use App\Models\Departments;
use Illuminate\Http\Request;
use App\Services\Configuration\Company\DepartmentsAndPositionsService;

class DepartmentsController extends Controller
{
     protected  $service;

     public function __construct( DepartmentsAndPositionsService $service) {
        $this->service = $service;
        
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       try {
          

            $departments = $this->service->getAll(['puestos', 'jefe', 'personal']);
            return response()->json([
                'success' => true,
                'message' => 'departamentos obtenidos exitosamente.',
                'data' => $departments
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
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Departments $departments)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Departments $departments)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Departments $departments)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Departments $departments)
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

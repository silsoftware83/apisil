<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\Personal\PersonalService;
use Illuminate\Support\Facades\Log;
class ColaboradoresController extends Controller
{
    protected  $personalService;

     public function __construct( PersonalService $personalService) {
        $this->personalService = $personalService;
        
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $personal = $this->personalService->listar();
        return response()->json($personal);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       
         try {
           
            $data = $this->personalService->crear( $request->all());
            return response()->json($data);
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

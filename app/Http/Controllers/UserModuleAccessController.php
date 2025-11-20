<?php

namespace App\Http\Controllers;

use App\Services\UserModuleAccessService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class UserModuleAccessController extends Controller
{
    protected $service;

    public function __construct(UserModuleAccessService $service)
    {
        $this->service = $service;
    }

    /**
     * Listar todos los accesos con paginación
     */
    public function index(Request $request): JsonResponse
    {
        try {
          

            $accesses = $this->service->listAccessesPaginated();

            return response()->json([
                'success' => true,
                'message' => 'Accesos obtenidos exitosamente.',
                'data' => $accesses
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los accesos.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Mostrar un acceso específico
     */
    public function show(int $id): JsonResponse
    {
        try {
            $result = $this->service->getAccessById($id);
            

            if (!$result || !$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => 'Acceso no encontrado.'
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => 'Acceso obtenido exitosamente.',
                'data' => $result->data
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener el acceso.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Crear un nuevo acceso
     */
    public function store(Request $request): JsonResponse
    {
        try {
            // Validación
            $validated = $request->validate([
                'user_id' => 'required|exists:users,id',
                'module_id' => 'required|exists:modules,id',
                'submodule_id' => 'nullable|exists:submodules,id',
                'subsubmodule_id' => 'nullable|exists:subsubmodules,id',
                'can_view' => 'boolean',
                'can_create' => 'boolean',
                'can_edit' => 'boolean',
                'can_delete' => 'boolean',
            ]);

            $result = $this->service->createAccess($validated);

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], 422);
            }

            return response()->json([
                'success' => true,
                'message' => $result->message,
                'data' => $result->data
            ], 201);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al crear el acceso.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Actualizar un acceso existente
     */
    public function update(Request $request, int $id): JsonResponse
    {
        try {
            // Validación
            $validated = $request->validate([
                'user_id' => 'required|exists:users,id',
                'module_id' => 'required|exists:modules,id',
                'submodule_id' => 'nullable|exists:submodules,id',
                'subsubmodule_id' => 'nullable|exists:subsubmodules,id',
                'can_view' => 'boolean',
                'can_create' => 'boolean',
                'can_edit' => 'boolean',
                'can_delete' => 'boolean',
            ]);

            $result = $this->service->updateAccess($id, $validated);

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], $result->message === 'Acceso no encontrado.' ? 404 : 422);
            }

            return response()->json([
                'success' => true,
                'message' => $result->message,
                'data' => $result->data
            ], 200);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al actualizar el acceso.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Eliminar un acceso
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            $result = $this->service->deleteAccess($id);

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], 404);
            }

            return response()->json([
                'success' => true,
                'message' => $result->message
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al eliminar el acceso.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Obtener accesos de un usuario específico
     */
    public function getUserAccesses(int $userId): JsonResponse
    {
        try {
            $accesses = $this->service->getUserAccesses($userId);

            return response()->json([
                'success' => true,
                'message' => 'Accesos del usuario obtenidos exitosamente.',
                'data' => $accesses
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los accesos del usuario.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Verificar si un usuario tiene un permiso específico
     */
    public function checkPermission(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'user_id' => 'required|exists:users,id',
                'module_id' => 'nullable|exists:modules,id',
                'submodule_id' => 'nullable|exists:submodules,id',
                'subsubmodule_id' => 'nullable|exists:subsubmodules,id',
                'permission' => 'required|in:can_view,can_create,can_edit,can_delete'
            ]);

            $hasPermission = $this->service->checkUserPermission(
                $validated['user_id'],
                $validated
            );

            return response()->json([
                'success' => true,
                'has_permission' => $hasPermission,
                'message' => $hasPermission ? 'El usuario tiene el permiso.' : 'El usuario no tiene el permiso.'
            ], 200);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al verificar el permiso.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Actualizar accesos de un usuario en lote
     */
    public function bulkUpdate(Request $request, int $userId): JsonResponse
    {
        try {
            $validated = $request->validate([
                'accesses' => 'required|array',
                'accesses.*.module_id' => 'required|exists:modules,id',
                'accesses.*.submodule_id' => 'nullable|exists:submodules,id',
                'accesses.*.subsubmodule_id' => 'nullable|exists:subsubmodules,id',
                'accesses.*.can_view' => 'boolean',
                'accesses.*.can_create' => 'boolean',
                'accesses.*.can_edit' => 'boolean',
                'accesses.*.can_delete' => 'boolean',
            ]);

            $result = $this->service->bulkUpdateUserAccesses($userId, $validated['accesses']);

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], 422);
            }

            return response()->json([
                'success' => true,
                'message' => $result->message
            ], 200);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al actualizar los accesos en lote.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Eliminar todos los accesos de un usuario
     */
    public function deleteUserAccesses(int $userId): JsonResponse
    {
        try {
            $result = $this->service->deleteUserAccesses($userId);

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], 422);
            }

            return response()->json([
                'success' => true,
                'message' => $result->message
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al eliminar los accesos del usuario.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Obtener estadísticas de accesos
     */
    public function stats(): JsonResponse
    {
        try {
            $stats = $this->service->getAccessStats();

            return response()->json([
                'success' => true,
                'message' => 'Estadísticas obtenidas exitosamente.',
                'data' => $stats
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener las estadísticas.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Obtener módulos accesibles por un usuario
     */
    public function getAccessibleModules(int $userId): JsonResponse
    {
        try {
            $accesses = $this->service->getUserAccesses($userId);
            
            // Agrupar por módulos
            $modules = $accesses->groupBy('module_id')->map(function ($items, $moduleId) {
                $moduleAccess = $items->first();
                return [
                    'module_id' => $moduleId,
                    'module_name' => $moduleAccess->module?->name,
                    'accesses' => $items->map(function ($item) {
                        return [
                            'id' => $item->id,
                            'level' => $item->access_level,
                            'name' => $item->access_name,
                            'submodule_id' => $item->submodule_id,
                            'submodule_name' => $item->submodule?->name,
                            'subsubmodule_id' => $item->subsubmodule_id,
                            'subsubmodule_name' => $item->subsubmodule?->name,
                            'permissions' => [
                                'can_view' => $item->can_view,
                                'can_create' => $item->can_create,
                                'can_edit' => $item->can_edit,
                                'can_delete' => $item->can_delete,
                            ]
                        ];
                    })
                ];
            })->values();

            return response()->json([
                'success' => true,
                'message' => 'Módulos accesibles obtenidos exitosamente.',
                'data' => $modules
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al obtener los módulos accesibles.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Clonar accesos de un usuario a otro
     */
    public function cloneAccesses(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'source_user_id' => 'required|exists:users,id',
                'target_user_id' => 'required|exists:users,id|different:source_user_id',
                'overwrite' => 'boolean'
            ]);

            $sourceAccesses = $this->service->getUserAccesses($validated['source_user_id']);

            if ($sourceAccesses->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'El usuario origen no tiene accesos para clonar.'
                ], 422);
            }

            // Si overwrite es true, eliminar accesos existentes del usuario destino
            if ($validated['overwrite'] ?? false) {
                $this->service->deleteUserAccesses($validated['target_user_id']);
            }

            // Preparar accesos para el usuario destino
            $accessesToCreate = $sourceAccesses->map(function ($access) {
                return [
                    'module_id' => $access->module_id,
                    'submodule_id' => $access->submodule_id,
                    'subsubmodule_id' => $access->subsubmodule_id,
                    'can_view' => $access->can_view,
                    'can_create' => $access->can_create,
                    'can_edit' => $access->can_edit,
                    'can_delete' => $access->can_delete,
                ];
            })->toArray();

            $result = $this->service->bulkUpdateUserAccesses(
                $validated['target_user_id'],
                $accessesToCreate
            );

            if (!$result->success) {
                return response()->json([
                    'success' => false,
                    'message' => $result->message
                ], 422);
            }

            return response()->json([
                'success' => true,
                'message' => 'Accesos clonados exitosamente.',
                'cloned_count' => count($accessesToCreate)
            ], 200);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors()
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error al clonar los accesos.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Services\ModuleService;
use App\Services\SubmoduleService;
use App\Services\UserModuleAccessService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class ModuleManagementController extends Controller
{
    protected ModuleService $moduleService;
    protected SubmoduleService $submoduleService;
    protected UserModuleAccessService $accessService;

    public function __construct(
        ModuleService $moduleService,
        SubmoduleService $submoduleService,
        UserModuleAccessService $accessService
    ) {
        $this->moduleService = $moduleService;
        $this->submoduleService = $submoduleService;
        $this->accessService = $accessService;
    }

    // ==================== MÓDULOS ====================

    /**
     * Listar todos los módulos con estructura completa
     */
    public function index(): JsonResponse
    {
        try {
            $modules = $this->moduleService->getModulesWithStructure();

            return response()->json([
                'success' => true,
                'data' => $modules,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Obtener módulos por usuario
     */
    public function getByUser(int $userId): JsonResponse
    {
        try {
            $modules = $this->moduleService->getModulesByUser($userId);

            return response()->json([
                'success' => true,
                'data' => $modules,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Obtener módulos para asignación de permisos
     */
    public function getForPermissionAssignment(int $userId): JsonResponse
    {
        try {
            $modules = $this->moduleService->getModulesForPermissionAssignment($userId);

            return response()->json([
                'success' => true,
                'data' => $modules,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Obtener un módulo específico
     */
    public function show(int $id): JsonResponse
    {
        try {
            $module = $this->moduleService->getModuleById($id);

            if (!$module) {
                return response()->json([
                    'success' => false,
                    'message' => 'Módulo no encontrado.',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $module,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Crear un nuevo módulo
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'slug' => 'nullable|string|max:255',
                'description' => 'nullable|string',
                'icon' => 'nullable|string|max:255',
                'route' => 'nullable|string|max:255',
                'order' => 'nullable|integer',
                'is_active' => 'nullable|boolean',
            ]);

            $module = $this->moduleService->createModule($validated);

            return response()->json([
                'success' => true,
                'message' => 'Módulo creado exitosamente.',
                'data' => $module,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Actualizar un módulo
     */
    public function update(Request $request, int $id): JsonResponse
    {
        try {
            $validated = $request->validate([
                'name' => 'sometimes|string|max:255',
                'slug' => 'nullable|string|max:255',
                'description' => 'nullable|string',
                'icon' => 'nullable|string|max:255',
                'route' => 'nullable|string|max:255',
                'order' => 'nullable|integer',
                'is_active' => 'nullable|boolean',
            ]);

            $module = $this->moduleService->updateModule($id, $validated);

            return response()->json([
                'success' => true,
                'message' => 'Módulo actualizado exitosamente.',
                'data' => $module,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Eliminar un módulo
     */
    public function destroy(int $id): JsonResponse
    {
        try {
            $this->moduleService->deleteModule($id);

            return response()->json([
                'success' => true,
                'message' => 'Módulo eliminado exitosamente.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Activar/Desactivar módulo
     */
    public function toggleStatus(int $id): JsonResponse
    {
        try {
            $module = $this->moduleService->toggleModuleStatus($id);

            return response()->json([
                'success' => true,
                'message' => 'Estado del módulo actualizado exitosamente.',
                'data' => $module,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Reordenar módulos
     */
    public function reorder(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'module_ids' => 'required|array',
                'module_ids.*' => 'required|integer|exists:modules,id',
            ]);

            $this->moduleService->reorderModules($validated['module_ids']);

            return response()->json([
                'success' => true,
                'message' => 'Módulos reordenados exitosamente.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    // ==================== SUBMÓDULOS ====================

    /**
     * Obtener submódulos de un módulo
     */
    public function getSubmodules(int $moduleId): JsonResponse
    {
        try {
            $submodules = $this->submoduleService->getSubmodulesByModule($moduleId);

            return response()->json([
                'success' => true,
                'data' => $submodules,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Obtener un submódulo específico
     */
    public function showSubmodule(int $id): JsonResponse
    {
        try {
            $submodule = $this->submoduleService->getSubmoduleById($id);

            if (!$submodule) {
                return response()->json([
                    'success' => false,
                    'message' => 'Submódulo no encontrado.',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $submodule,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Crear un submódulo
     */
    public function storeSubmodule(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'module_id' => 'required|integer|exists:modules,id',
                'parent_submodule_id' => 'nullable|integer|exists:submodules,id',
                'name' => 'required|string|max:255',
                'slug' => 'nullable|string|max:255',
                'description' => 'nullable|string',
                'icon' => 'nullable|string|max:255',
                'route' => 'nullable|string|max:255',
                'order' => 'nullable|integer',
                'is_active' => 'nullable|boolean',
            ]);

            $submodule = $this->submoduleService->createSubmodule($validated);

            return response()->json([
                'success' => true,
                'message' => 'Submódulo creado exitosamente.',
                'data' => $submodule,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Actualizar un submódulo
     */
    public function updateSubmodule(Request $request, int $id): JsonResponse
    {
        try {
            $validated = $request->validate([
                'module_id' => 'sometimes|integer|exists:modules,id',
                'parent_submodule_id' => 'nullable|integer|exists:submodules,id',
                'name' => 'sometimes|string|max:255',
                'slug' => 'nullable|string|max:255',
                'description' => 'nullable|string',
                'icon' => 'nullable|string|max:255',
                'route' => 'nullable|string|max:255',
                'order' => 'nullable|integer',
                'is_active' => 'nullable|boolean',
            ]);

            $submodule = $this->submoduleService->updateSubmodule($id, $validated);

            return response()->json([
                'success' => true,
                'message' => 'Submódulo actualizado exitosamente.',
                'data' => $submodule,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Eliminar un submódulo
     */
    public function destroySubmodule(int $id): JsonResponse
    {
        try {
            $this->submoduleService->deleteSubmodule($id);

            return response()->json([
                'success' => true,
                'message' => 'Submódulo eliminado exitosamente.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Activar/Desactivar submódulo
     */
    public function toggleSubmoduleStatus(int $id): JsonResponse
    {
        try {
            $submodule = $this->submoduleService->toggleSubmoduleStatus($id);

            return response()->json([
                'success' => true,
                'message' => 'Estado del submódulo actualizado exitosamente.',
                'data' => $submodule,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    // ==================== PERMISOS DE ACCESO ====================

    /**
     * Obtener accesos de un usuario
     */
    public function getUserAccess(int $userId): JsonResponse
    {
        try {
            $access = $this->accessService->getUserAccessFormatted($userId);

            return response()->json([
                'success' => true,
                'data' => $access,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    /**
     * Asignar acceso a módulo
     */
    public function assignModuleAccess(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'user_id' => 'required|integer|exists:users,id',
                'module_id' => 'required|integer|exists:modules,id',
                'can_view' => 'required|boolean',
                'can_create' => 'required|boolean',
                'can_edit' => 'required|boolean',
                'can_delete' => 'required|boolean',
            ]);

            $access = $this->accessService->assignModuleAccess(
                $validated['user_id'],
                $validated['module_id'],
                [
                    'can_view' => $validated['can_view'],
                    'can_create' => $validated['can_create'],
                    'can_edit' => $validated['can_edit'],
                    'can_delete' => $validated['can_delete'],
                ]
            );

            return response()->json([
                'success' => true,
                'message' => 'Acceso asignado exitosamente.',
                'data' => $access,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Asignar acceso a submódulo
     */
    public function assignSubmoduleAccess(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'user_id' => 'required|integer|exists:users,id',
                'module_id' => 'required|integer|exists:modules,id',
                'submodule_id' => 'required|integer|exists:submodules,id',
                'can_view' => 'required|boolean',
                'can_create' => 'required|boolean',
                'can_edit' => 'required|boolean',
                'can_delete' => 'required|boolean',
            ]);

            $access = $this->accessService->assignSubmoduleAccess(
                $validated['user_id'],
                $validated['module_id'],
                $validated['submodule_id'],
                [
                    'can_view' => $validated['can_view'],
                    'can_create' => $validated['can_create'],
                    'can_edit' => $validated['can_edit'],
                    'can_delete' => $validated['can_delete'],
                ]
            );

            return response()->json([
                'success' => true,
                'message' => 'Acceso asignado exitosamente.',
                'data' => $access,
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Asignar accesos masivos
     */
    public function bulkAssignAccess(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'user_id' => 'required|integer|exists:users,id',
                'accesses' => 'required|array',
                'accesses.*.module_id' => 'required|integer|exists:modules,id',
                'accesses.*.submodule_id' => 'nullable|integer|exists:submodules,id',
                'accesses.*.subsubmodule_id' => 'nullable|integer|exists:submodules,id',
                'accesses.*.can_view' => 'required|boolean',
                'accesses.*.can_create' => 'required|boolean',
                'accesses.*.can_edit' => 'required|boolean',
                'accesses.*.can_delete' => 'required|boolean',
            ]);

            $results = $this->accessService->bulkAssignAccess(
                $validated['user_id'],
                $validated['accesses']
            );

            return response()->json([
                'success' => true,
                'message' => 'Accesos procesados.',
                'data' => $results,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Revocar acceso específico
     */
    public function revokeAccess(Request $request): JsonResponse
    {
        try {
            $validated = $request->validate([
                'user_id' => 'required|integer|exists:users,id',
                'module_id' => 'required|integer|exists:modules,id',
                'submodule_id' => 'nullable|integer|exists:submodules,id',
                'subsubmodule_id' => 'nullable|integer|exists:submodules,id',
            ]);

            $this->accessService->revokeAccess(
                $validated['user_id'],
                $validated['module_id'],
                $validated['submodule_id'] ?? null,
                $validated['subsubmodule_id'] ?? null
            );

            return response()->json([
                'success' => true,
                'message' => 'Acceso revocado exitosamente.',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    /**
     * Revocar todos los accesos de un usuario
     */
    public function revokeAllUserAccess(int $userId): JsonResponse
    {
        try {
            $count = $this->accessService->revokeAllUserAccess($userId);

            return response()->json([
                'success' => true,
                'message' => "Se revocaron {$count} accesos del usuario.",
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 400);
        }
    }
}
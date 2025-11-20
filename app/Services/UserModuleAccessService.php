<?php

namespace App\Services;

use App\Repositories\UserModuleAccessRepository;
use App\Repositories\ModuleRepository;
use App\Repositories\SubmoduleRepository;
use Illuminate\Database\Eloquent\Collection;

class UserModuleAccessService
{
    protected UserModuleAccessRepository $accessRepository;
    protected ModuleRepository $moduleRepository;
    protected SubmoduleRepository $submoduleRepository;

    public function __construct(
        UserModuleAccessRepository $accessRepository,
        ModuleRepository $moduleRepository,
        SubmoduleRepository $submoduleRepository
    ) {
        $this->accessRepository = $accessRepository;
        $this->moduleRepository = $moduleRepository;
        $this->submoduleRepository = $submoduleRepository;
    }

    /**
     * Obtener todos los accesos de un usuario con sus relaciones
     */
    public function getUserAccess(int $userId): Collection
    {
        return $this->accessRepository->getByUserWithRelations($userId);
    }

    /**
     * Obtener accesos formateados de un usuario (estructura jerárquica)
     */
    public function getUserAccessFormatted(int $userId): array
    {
        $accesses = $this->accessRepository->getByUserWithRelations($userId);

        $formatted = [];

        foreach ($accesses as $access) {
            $moduleId = $access->module_id;

            if (!isset($formatted[$moduleId])) {
                $formatted[$moduleId] = [
                    'module' => $access->module,
                    'permissions' => $this->getPermissionsArray($access),
                    'submodules' => [],
                ];
            }

            if ($access->submodule_id && !$access->subsubmodule_id) {
                $formatted[$moduleId]['submodules'][$access->submodule_id] = [
                    'submodule' => $access->submodule,
                    'permissions' => $this->getPermissionsArray($access),
                    'subsubmodules' => [],
                ];
            }

            if ($access->subsubmodule_id) {
                $submoduleId = $access->submodule_id;
                if (!isset($formatted[$moduleId]['submodules'][$submoduleId])) {
                    $formatted[$moduleId]['submodules'][$submoduleId] = [
                        'submodule' => $access->submodule,
                        'permissions' => [],
                        'subsubmodules' => [],
                    ];
                }

                $formatted[$moduleId]['submodules'][$submoduleId]['subsubmodules'][] = [
                    'subsubmodule' => $access->subsubmodule,
                    'permissions' => $this->getPermissionsArray($access),
                ];
            }
        }

        return array_values($formatted);
    }

    /**
     * Asignar acceso a un módulo para un usuario
     */
    public function assignModuleAccess(int $userId, int $moduleId, array $permissions): array
    {
        // Verificar que el módulo existe
        $module = $this->moduleRepository->findById($moduleId);
        
        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        $access = $this->accessRepository->createOrUpdate(
            [
                'user_id' => $userId,
                'module_id' => $moduleId,
                'submodule_id' => null,
                'subsubmodule_id' => null,
            ],
            [
                'can_view' => $permissions['can_view'] ?? false,
                'can_create' => $permissions['can_create'] ?? false,
                'can_edit' => $permissions['can_edit'] ?? false,
                'can_delete' => $permissions['can_delete'] ?? false,
            ]
        );

        return $this->formatAccessResponse($access);
    }

    /**
     * Asignar acceso a un submódulo para un usuario
     */
    public function assignSubmoduleAccess(int $userId, int $moduleId, int $submoduleId, array $permissions): array
    {
        // Verificar que el submódulo existe
        $submodule = $this->submoduleRepository->findById($submoduleId);
        
        if (!$submodule) {
            throw new \Exception('Submódulo no encontrado.');
        }

        // Verificar que el submódulo pertenece al módulo
        if ($submodule->module_id != $moduleId) {
            throw new \Exception('El submódulo no pertenece al módulo especificado.');
        }

        $access = $this->accessRepository->createOrUpdate(
            [
                'user_id' => $userId,
                'module_id' => $moduleId,
                'submodule_id' => $submoduleId,
                'subsubmodule_id' => null,
            ],
            [
                'can_view' => $permissions['can_view'] ?? false,
                'can_create' => $permissions['can_create'] ?? false,
                'can_edit' => $permissions['can_edit'] ?? false,
                'can_delete' => $permissions['can_delete'] ?? false,
            ]
        );

        return $this->formatAccessResponse($access);
    }

    /**
     * Asignar acceso a un subsubmódulo para un usuario
     */
    public function assignSubsubmoduleAccess(int $userId, int $moduleId, int $submoduleId, int $subsubmoduleId, array $permissions): array
    {
        // Verificar que el subsubmódulo existe
        $subsubmodule = $this->submoduleRepository->findById($subsubmoduleId);
        
        if (!$subsubmodule) {
            throw new \Exception('Subsubmódulo no encontrado.');
        }

        // Verificar que el subsubmódulo es hijo del submódulo
        if ($subsubmodule->parent_submodule_id != $submoduleId) {
            throw new \Exception('El subsubmódulo no pertenece al submódulo especificado.');
        }

        $access = $this->accessRepository->createOrUpdate(
            [
                'user_id' => $userId,
                'module_id' => $moduleId,
                'submodule_id' => $submoduleId,
                'subsubmodule_id' => $subsubmoduleId,
            ],
            [
                'can_view' => $permissions['can_view'] ?? false,
                'can_create' => $permissions['can_create'] ?? false,
                'can_edit' => $permissions['can_edit'] ?? false,
                'can_delete' => $permissions['can_delete'] ?? false,
            ]
        );

        return $this->formatAccessResponse($access);
    }

    /**
     * Asignar accesos masivos para un usuario
     */
    public function bulkAssignAccess(int $userId, array $accessData): array
    {
        $results = [];

        foreach ($accessData as $access) {
            try {
                if (isset($access['subsubmodule_id'])) {
                    // Acceso a subsubmódulo
                    $result = $this->assignSubsubmoduleAccess(
                        $userId,
                        $access['module_id'],
                        $access['submodule_id'],
                        $access['subsubmodule_id'],
                        [
                            'can_view' => $access['can_view'] ?? false,
                            'can_create' => $access['can_create'] ?? false,
                            'can_edit' => $access['can_edit'] ?? false,
                            'can_delete' => $access['can_delete'] ?? false,
                        ]
                    );
                } elseif (isset($access['submodule_id'])) {
                    // Acceso a submódulo
                    $result = $this->assignSubmoduleAccess(
                        $userId,
                        $access['module_id'],
                        $access['submodule_id'],
                        [
                            'can_view' => $access['can_view'] ?? false,
                            'can_create' => $access['can_create'] ?? false,
                            'can_edit' => $access['can_edit'] ?? false,
                            'can_delete' => $access['can_delete'] ?? false,
                        ]
                    );
                } else {
                    // Acceso a módulo
                    $result = $this->assignModuleAccess(
                        $userId,
                        $access['module_id'],
                        [
                            'can_view' => $access['can_view'] ?? false,
                            'can_create' => $access['can_create'] ?? false,
                            'can_edit' => $access['can_edit'] ?? false,
                            'can_delete' => $access['can_delete'] ?? false,
                        ]
                    );
                }

                $results[] = [
                    'success' => true,
                    'data' => $result,
                ];
            } catch (\Exception $e) {
                $results[] = [
                    'success' => false,
                    'error' => $e->getMessage(),
                    'data' => $access,
                ];
            }
        }

        return $results;
    }

    /**
     * Revocar acceso específico
     */
    public function revokeAccess(int $userId, int $moduleId, ?int $submoduleId = null, ?int $subsubmoduleId = null): bool
    {
        if ($subsubmoduleId) {
            $access = $this->accessRepository->findByUserAndSubsubmodule($userId, $subsubmoduleId);
        } elseif ($submoduleId) {
            $access = $this->accessRepository->findByUserAndSubmodule($userId, $submoduleId);
        } else {
            $access = $this->accessRepository->findByUserAndModule($userId, $moduleId);
        }

        if (!$access) {
            throw new \Exception('Acceso no encontrado.');
        }

        return $this->accessRepository->delete($access->id);
    }

    /**
     * Revocar todos los accesos de un usuario
     */
    public function revokeAllUserAccess(int $userId): int
    {
        return $this->accessRepository->deleteAllByUser($userId);
    }

    /**
     * Revocar accesos de un usuario a un módulo específico
     */
    public function revokeUserModuleAccess(int $userId, int $moduleId): int
    {
        return $this->accessRepository->deleteByUserAndModule($userId, $moduleId);
    }

    /**
     * Verificar si usuario tiene acceso
     */
    public function userHasAccess(int $userId, int $moduleId, ?int $submoduleId = null): bool
    {
        if ($submoduleId) {
            return $this->accessRepository->userHasAccessToSubmodule($userId, $submoduleId);
        }

        return $this->accessRepository->userHasAccessToModule($userId, $moduleId);
    }

    /**
     * Obtener permisos específicos de usuario
     */
    public function getUserPermissions(int $userId, int $moduleId, ?int $submoduleId = null, ?int $subsubmoduleId = null): ?array
    {
        if ($subsubmoduleId) {
            $access = $this->accessRepository->findByUserAndSubsubmodule($userId, $subsubmoduleId);
        } elseif ($submoduleId) {
            $access = $this->accessRepository->findByUserAndSubmodule($userId, $submoduleId);
        } else {
            $access = $this->accessRepository->findByUserAndModule($userId, $moduleId);
        }

        if (!$access) {
            return null;
        }

        return $this->getPermissionsArray($access);
    }

    /**
     * Obtener array de permisos
     */
    private function getPermissionsArray($access): array
    {
        return [
            'can_view' => $access->can_view,
            'can_create' => $access->can_create,
            'can_edit' => $access->can_edit,
            'can_delete' => $access->can_delete,
        ];
    }

    /**
     * Formatear respuesta de acceso
     */
    private function formatAccessResponse($access): array
    {
        return [
            'id' => $access->id,
            'user_id' => $access->user_id,
            'module_id' => $access->module_id,
            'submodule_id' => $access->submodule_id,
            'subsubmodule_id' => $access->subsubmodule_id,
            'permissions' => $this->getPermissionsArray($access),
            'created_at' => $access->created_at,
            'updated_at' => $access->updated_at,
        ];
    }
}
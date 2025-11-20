<?php

namespace App\Repositories;

use App\Models\UserModuleAccess;
use Illuminate\Database\Eloquent\Collection;

class UserModuleAccessRepository
{
    /**
     * Obtener todos los accesos
     */
    public function getAll(): Collection
    {
        return UserModuleAccess::all();
    }

    /**
     * Obtener accesos por usuario
     */
    public function getByUser(int $userId): Collection
    {
        return UserModuleAccess::forUser($userId)->get();
    }

    /**
     * Obtener accesos por usuario con relaciones cargadas
     */
    public function getByUserWithRelations(int $userId): Collection
    {
        return UserModuleAccess::forUser($userId)
            ->with(['module', 'submodule', 'subsubmodule'])
            ->get();
    }

    /**
     * Obtener acceso específico por usuario y módulo
     */
    public function findByUserAndModule(int $userId, int $moduleId): ?UserModuleAccess
    {
        return UserModuleAccess::forUser($userId)
            ->forModule($moduleId)
            ->whereNull('submodule_id')
            ->whereNull('subsubmodule_id')
            ->first();
    }

    /**
     * Obtener acceso específico por usuario y submódulo
     */
    public function findByUserAndSubmodule(int $userId, int $submoduleId): ?UserModuleAccess
    {
        return UserModuleAccess::forUser($userId)
            ->forSubmodule($submoduleId)
            ->whereNull('subsubmodule_id')
            ->first();
    }

    /**
     * Obtener acceso específico por usuario y subsubmódulo
     */
    public function findByUserAndSubsubmodule(int $userId, int $subsubmoduleId): ?UserModuleAccess
    {
        return UserModuleAccess::forUser($userId)
            ->where('subsubmodule_id', $subsubmoduleId)
            ->first();
    }

    /**
     * Crear nuevo acceso
     */
    public function create(array $data): UserModuleAccess
    {
        return UserModuleAccess::create($data);
    }

    /**
     * Actualizar acceso existente
     */
    public function update(int $id, array $data): bool
    {
        $access = UserModuleAccess::find($id);
        
        if (!$access) {
            return false;
        }

        return $access->update($data);
    }

    /**
     * Eliminar acceso
     */
    public function delete(int $id): bool
    {
        $access = UserModuleAccess::find($id);
        
        if (!$access) {
            return false;
        }

        return $access->delete();
    }

    /**
     * Crear o actualizar acceso (upsert)
     */
    public function createOrUpdate(array $conditions, array $data): UserModuleAccess
    {
        return UserModuleAccess::updateOrCreate($conditions, $data);
    }

    /**
     * Eliminar todos los accesos de un usuario
     */
    public function deleteAllByUser(int $userId): int
    {
        return UserModuleAccess::forUser($userId)->delete();
    }

    /**
     * Eliminar accesos de un usuario para un módulo específico
     */
    public function deleteByUserAndModule(int $userId, int $moduleId): int
    {
        return UserModuleAccess::forUser($userId)
            ->forModule($moduleId)
            ->delete();
    }

    /**
     * Verificar si un usuario tiene acceso a un módulo
     */
    public function userHasAccessToModule(int $userId, int $moduleId): bool
    {
        return UserModuleAccess::forUser($userId)
            ->forModule($moduleId)
            ->canView()
            ->exists();
    }

    /**
     * Verificar si un usuario tiene acceso a un submódulo
     */
    public function userHasAccessToSubmodule(int $userId, int $submoduleId): bool
    {
        return UserModuleAccess::forUser($userId)
            ->forSubmodule($submoduleId)
            ->canView()
            ->exists();
    }

    /**
     * Obtener permisos específicos de usuario para un módulo
     */
    public function getUserPermissionsForModule(int $userId, int $moduleId): ?array
    {
        $access = $this->findByUserAndModule($userId, $moduleId);
        
        if (!$access) {
            return null;
        }

        return [
            'can_view' => $access->can_view,
            'can_create' => $access->can_create,
            'can_edit' => $access->can_edit,
            'can_delete' => $access->can_delete,
        ];
    }

    /**
     * Asignar accesos masivos para un usuario
     */
    public function bulkAssignAccess(int $userId, array $accessData): void
    {
        foreach ($accessData as $access) {
            $this->createOrUpdate(
                [
                    'user_id' => $userId,
                    'module_id' => $access['module_id'] ?? null,
                    'submodule_id' => $access['submodule_id'] ?? null,
                    'subsubmodule_id' => $access['subsubmodule_id'] ?? null,
                ],
                [
                    'can_view' => $access['can_view'] ?? false,
                    'can_create' => $access['can_create'] ?? false,
                    'can_edit' => $access['can_edit'] ?? false,
                    'can_delete' => $access['can_delete'] ?? false,
                ]
            );
        }
    }

    /**
     * Verificar si usuario tiene algún acceso asignado
     */
    public function userHasAnyAccess(int $userId): bool
    {
        return UserModuleAccess::forUser($userId)->exists();
    }

    /**
     * Obtener todos los usuarios con acceso a un módulo específico
     */
    public function getUsersByModule(int $moduleId): Collection
    {
        return UserModuleAccess::forModule($moduleId)
            ->with('user')
            ->get()
            ->pluck('user')
            ->unique('id');
    }
}
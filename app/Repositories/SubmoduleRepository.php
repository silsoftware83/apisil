<?php

namespace App\Repositories;

use App\Models\Submodule;
use Illuminate\Database\Eloquent\Collection;

class SubmoduleRepository
{
    /**
     * Obtener todos los submódulos
     */
    public function getAll(): Collection
    {
        return Submodule::ordered()->get();
    }

    /**
     * Obtener todos los submódulos activos
     */
    public function getAllActive(): Collection
    {
        return Submodule::active()->ordered()->get();
    }

    /**
     * Obtener submódulos por módulo
     */
    public function getByModule(int $moduleId): Collection
    {
        return Submodule::where('module_id', $moduleId)
            ->ordered()
            ->get();
    }

    /**
     * Obtener submódulos activos por módulo
     */
    public function getActiveByModule(int $moduleId): Collection
    {
        return Submodule::where('module_id', $moduleId)
            ->active()
            ->ordered()
            ->get();
    }

    /**
     * Obtener submódulos de primer nivel por módulo (con hijos)
     */
    public function getFirstLevelByModule(int $moduleId): Collection
    {
        return Submodule::where('module_id', $moduleId)
            ->firstLevel()
            ->with(['childSubmodules' => function ($query) {
                $query->ordered();
            }])
            ->ordered()
            ->get();
    }

    /**
     * Obtener submódulos hijos de un submódulo padre
     */
    public function getChildrenByParent(int $parentId): Collection
    {
        return Submodule::where('parent_submodule_id', $parentId)
            ->ordered()
            ->get();
    }

    /**
     * Obtener submódulo por ID
     */
    public function findById(int $id): ?Submodule
    {
        return Submodule::find($id);
    }

    /**
     * Obtener submódulo por ID con hijos
     */
    public function findByIdWithChildren(int $id): ?Submodule
    {
        return Submodule::with(['childSubmodules' => function ($query) {
            $query->ordered();
        }])->find($id);
    }

    /**
     * Obtener submódulo por slug
     */
    public function findBySlug(string $slug): ?Submodule
    {
        return Submodule::where('slug', $slug)->first();
    }

    /**
     * Crear un nuevo submódulo
     */
    public function create(array $data): Submodule
    {
        return Submodule::create($data);
    }

    /**
     * Actualizar un submódulo
     */
    public function update(int $id, array $data): bool
    {
        $submodule = $this->findById($id);
        
        if (!$submodule) {
            return false;
        }

        return $submodule->update($data);
    }

    /**
     * Eliminar un submódulo (soft delete)
     */
    public function delete(int $id): bool
    {
        $submodule = $this->findById($id);
        
        if (!$submodule) {
            return false;
        }

        return $submodule->delete();
    }

    /**
     * Verificar si existe un slug
     */
    public function slugExists(string $slug, ?int $excludeId = null): bool
    {
        $query = Submodule::where('slug', $slug);
        
        if ($excludeId) {
            $query->where('id', '!=', $excludeId);
        }
        
        return $query->exists();
    }

    /**
     * Obtener el último order usado en un módulo
     */
    public function getMaxOrderByModule(int $moduleId): int
    {
        return Submodule::where('module_id', $moduleId)->max('order') ?? 0;
    }

    /**
     * Obtener submódulos por usuario (con permisos)
     */
    public function getByUser(int $userId): Collection
    {
        return Submodule::whereHas('userAccess', function ($query) use ($userId) {
            $query->where('user_id', $userId)
                  ->where('can_view', true);
        })
        ->ordered()
        ->get();
    }

    /**
     * Obtener submódulos activos por módulo y usuario
     */
    public function getActiveByModuleAndUser(int $moduleId, int $userId): Collection
    {
        return Submodule::where('module_id', $moduleId)
            ->active()
            ->whereHas('userAccess', function ($query) use ($userId) {
                $query->where('user_id', $userId)
                      ->where('can_view', true);
            })
            ->with(['childSubmodules' => function ($query) use ($userId) {
                $query->active()
                      ->whereHas('userAccess', function ($q) use ($userId) {
                          $q->where('user_id', $userId)
                            ->where('can_view', true);
                      })
                      ->ordered();
            }])
            ->ordered()
            ->get();
    }

    /**
     * Obtener submódulos por usuario con permisos
     */
    public function getByUserWithPermissions(int $userId): Collection
    {
        return Submodule::whereHas('userAccess', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        })
        ->with(['userAccess' => function ($query) use ($userId) {
            $query->where('user_id', $userId);
        }])
        ->ordered()
        ->get();
    }
}
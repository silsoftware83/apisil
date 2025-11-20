<?php

namespace App\Repositories;

use App\Models\Module;
use App\Models\Submodule as SubModules;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\Log;

class ModuleRepository
{
    /**
     * Obtener todos los módulos
     */
    public function getAll(): Collection
    {
        return Module::ordered()->get();
    }

    /**
     * Obtener todos los módulos activos
     */
    public function getAllActive(): Collection
    {
        return Module::active()->ordered()->get();
    }

    /**
     * Obtener todos los módulos con sus submódulos
     */
    public function getAllWithSubmodules(): Collection
    {
        return Module::with(['submodules' => function ($query) {
            $query->ordered();
        }])->ordered()->get();
    }

    /**
     * Obtener todos los módulos activos con submódulos activos (estructura completa anidada)
     */
    public function getAllActiveWithSubmodules(): Collection
    {
        return Module::active()
            ->with([
                'submodules' => function ($query) {
                    $query->active()->firstLevel()->ordered();
                },
                'submodules.childSubmodules' => function ($query) {
                    $query->active()->ordered();
                }
            ])
            ->ordered()
            ->get();
    }

    /**
     * Obtener módulo por ID
     */
    public function findById(int $id): ?Module
    {
        return Module::find($id);
    }

    /**
     * Obtener módulo por ID con submódulos
     */
    public function findByIdWithSubmodules(int $id): ?Module
    {
        return Module::with([
            'submodules' => function ($query) {
                $query->firstLevel()->ordered();
            },
            'submodules.childSubmodules' => function ($query) {
                $query->ordered();
            }
        ])->find($id);
    }

    /**
     * Obtener módulo por slug
     */
    public function findBySlug(string $slug): ?Module
    {
        return Module::where('slug', $slug)->first();
    }

    /**
     * Crear un nuevo módulo
     */
    public function create(array $data): Module
    {
        return Module::create($data);
    }

    /**
     * Actualizar un módulo
     */
    public function update(int $id, array $data): bool
    {
        $module = $this->findById($id);
        
        if (!$module) {
            return false;
        }

        return $module->update($data);
    }

    /**
     * Eliminar un módulo (soft delete)
     */
    public function delete(int $id): bool
    {
        $module = $this->findById($id);
        
        if (!$module) {
            return false;
        }

        return $module->delete();
    }

    /**
     * Verificar si existe un slug
     */
    public function slugExists(string $slug, ?int $excludeId = null): bool
    {
        $query = Module::where('slug', $slug);
        
        if ($excludeId) {
            $query->where('id', '!=', $excludeId);
        }
        
        return $query->exists();
    }

    /**
     * Obtener el último order usado
     */
    public function getMaxOrder(): int
    {
        return Module::max('order') ?? 0;
    }

    /**
     * Obtener módulos por usuario (con permisos)
     */
    public function getByUser(int $userId): Collection
    {
        return Module::whereHas('userAccess', function ($query) use ($userId) {
            $query->where('user_id', $userId)
                  ->where('can_view', true);
        })
        ->ordered()
        ->get();
    }

    /**
     * Obtener módulos activos por usuario con submódulos permitidos (estructura completa)
     */
    public function getActiveByUserWithSubmodules(int $userId)
{
    Log::info("Fetching active modules for user ID: $userId");

    $modules = Module::active()
        ->whereHas('userAccess', function ($query) use ($userId) {
            $query->where('user_id', $userId)
                  ->where('can_view', true);
        })
        ->with([
            'submodules' => function ($query) use ($userId) {
                $query->active()
                      ->firstLevel()
                      ->whereHas('userAccess', function ($q) use ($userId) {
                          $q->where('user_id', $userId)
                            ->where('can_view', true);
                      })
                      ->with(['childSubmodules' => function ($q) use ($userId) {
                          $q->active()
                            ->whereHas('userAccess', function ($x) use ($userId) {
                                $x->where('user_id', $userId)
                                  ->where('can_view', true);
                            })
                            ->ordered();
                      }])
                      ->ordered();
            }
        ])
        ->ordered()
        ->get();

    // Debug: Mostrar estructura en logs
    foreach ($modules as $module) {
       
        foreach ($module->submodules as $sub) {
            $sub->childSubmodules=SubModules::where('parent_submodule_id',$sub->id)->get();
            Log::info(" Submodule: {$sub->name}");
            
        }
    }

    return $modules;
}




    /**
     * Obtener módulos por usuario con todos los permisos cargados
     */
    public function getByUserWithPermissions(int $userId): Collection
    {
        return Module::whereHas('userAccess', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        })
        ->with(['userAccess' => function ($query) use ($userId) {
            $query->where('user_id', $userId);
        }])
        ->ordered()
        ->get();
    }

    /**
     * Obtener módulos por usuario o todos si no tiene ninguno asignado
     * Útil para pantallas de asignación de permisos
     */
    public function getForUserOrAll(int $userId): Collection
    {
        // Verificar si el usuario tiene algún acceso asignado
        $hasAccess = \App\Models\UserModuleAccess::where('user_id', $userId)->exists();
        
        if ($hasAccess) {
            // Si tiene accesos, traer solo sus módulos con permisos
            return $this->getByUserWithPermissions($userId);
        }
        
        // Si no tiene ningún acceso, traer todos los módulos activos con estructura completa
        return Module::active()
            ->with([
                'submodules' => function ($query) {
                    $query->active()->firstLevel()->ordered();
                },
                'submodules.childSubmodules' => function ($query) {
                    $query->active()->ordered();
                }
            ])
            ->ordered()
            ->get();
    }
}
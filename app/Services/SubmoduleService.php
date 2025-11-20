<?php

namespace App\Services;

use App\Repositories\SubmoduleRepository;
use App\Repositories\ModuleRepository;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Str;

class SubmoduleService
{
    protected SubmoduleRepository $submoduleRepository;
    protected ModuleRepository $moduleRepository;

    public function __construct(
        SubmoduleRepository $submoduleRepository,
        ModuleRepository $moduleRepository
    ) {
        $this->submoduleRepository = $submoduleRepository;
        $this->moduleRepository = $moduleRepository;
    }

    /**
     * Obtener todos los submódulos
     */
    public function getAllSubmodules(): Collection
    {
        return $this->submoduleRepository->getAll();
    }

    /**
     * Obtener submódulos por módulo
     */
    public function getSubmodulesByModule(int $moduleId): Collection
    {
        // Verificar que el módulo existe
        $module = $this->moduleRepository->findById($moduleId);
        
        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        return $this->submoduleRepository->getFirstLevelByModule($moduleId);
    }

    /**
     * Obtener submódulos por usuario
     */
    public function getSubmodulesByUser(int $userId): Collection
    {
        return $this->submoduleRepository->getByUser($userId);
    }

    /**
     * Obtener submódulos por módulo y usuario
     */
    public function getSubmodulesByModuleAndUser(int $moduleId, int $userId): Collection
    {
        return $this->submoduleRepository->getActiveByModuleAndUser($moduleId, $userId);
    }

    /**
     * Obtener un submódulo por ID
     */
    public function getSubmoduleById(int $id): ?array
    {
        $submodule = $this->submoduleRepository->findByIdWithChildren($id);
        
        if (!$submodule) {
            return null;
        }

        return $this->formatSubmoduleResponse($submodule);
    }

    /**
     * Crear un nuevo submódulo
     */
    public function createSubmodule(array $data): array
    {
        // Verificar que el módulo existe
        $module = $this->moduleRepository->findById($data['module_id']);
        
        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        // Si tiene parent_submodule_id, verificar que existe
        if (isset($data['parent_submodule_id']) && !empty($data['parent_submodule_id'])) {
            $parentSubmodule = $this->submoduleRepository->findById($data['parent_submodule_id']);
            
            if (!$parentSubmodule) {
                throw new \Exception('Submódulo padre no encontrado.');
            }

            // Calcular el nivel basado en el padre
            $data['level'] = $parentSubmodule->level + 1;
        } else {
            $data['level'] = 1;
            $data['parent_submodule_id'] = null;
        }

        // Generar slug si no viene
        if (!isset($data['slug']) || empty($data['slug'])) {
            $data['slug'] = Str::slug($data['name']);
        }

        // Validar que el slug sea único
        if ($this->submoduleRepository->slugExists($data['slug'])) {
            throw new \Exception('El slug ya existe. Por favor elige otro nombre.');
        }

        // Asignar order si no viene
        if (!isset($data['order'])) {
            $data['order'] = $this->submoduleRepository->getMaxOrderByModule($data['module_id']) + 1;
        }

        // Valores por defecto
        $data['is_active'] = $data['is_active'] ?? true;

        $submodule = $this->submoduleRepository->create($data);

        return $this->formatSubmoduleResponse($submodule);
    }

    /**
     * Actualizar un submódulo
     */
    public function updateSubmodule(int $id, array $data): array
    {
        $submodule = $this->submoduleRepository->findById($id);

        if (!$submodule) {
            throw new \Exception('Submódulo no encontrado.');
        }

        // Si se cambia el parent_submodule_id, recalcular nivel
        if (isset($data['parent_submodule_id'])) {
            if (!empty($data['parent_submodule_id'])) {
                $parentSubmodule = $this->submoduleRepository->findById($data['parent_submodule_id']);
                
                if (!$parentSubmodule) {
                    throw new \Exception('Submódulo padre no encontrado.');
                }

                // Evitar ciclos: el padre no puede ser hijo del submódulo actual
                if ($data['parent_submodule_id'] == $id) {
                    throw new \Exception('Un submódulo no puede ser padre de sí mismo.');
                }

                $data['level'] = $parentSubmodule->level + 1;
            } else {
                $data['level'] = 1;
                $data['parent_submodule_id'] = null;
            }
        }

        // Si se actualiza el nombre y no el slug, regenerar slug
        if (isset($data['name']) && (!isset($data['slug']) || empty($data['slug']))) {
            $data['slug'] = Str::slug($data['name']);
        }

        // Validar slug único (excluyendo el submódulo actual)
        if (isset($data['slug']) && $this->submoduleRepository->slugExists($data['slug'], $id)) {
            throw new \Exception('El slug ya existe. Por favor elige otro nombre.');
        }

        $this->submoduleRepository->update($id, $data);

        $updatedSubmodule = $this->submoduleRepository->findById($id);

        return $this->formatSubmoduleResponse($updatedSubmodule);
    }

    /**
     * Eliminar un submódulo
     */
    public function deleteSubmodule(int $id): bool
    {
        $submodule = $this->submoduleRepository->findById($id);

        if (!$submodule) {
            throw new \Exception('Submódulo no encontrado.');
        }

        // Verificar si tiene hijos
        $hasChildren = $this->submoduleRepository->getChildrenByParent($id)->isNotEmpty();
        
        if ($hasChildren) {
            throw new \Exception('No se puede eliminar un submódulo que tiene submódulos hijos.');
        }

        return $this->submoduleRepository->delete($id);
    }

    /**
     * Activar/Desactivar un submódulo
     */
    public function toggleSubmoduleStatus(int $id): array
    {
        $submodule = $this->submoduleRepository->findById($id);

        if (!$submodule) {
            throw new \Exception('Submódulo no encontrado.');
        }

        $newStatus = !$submodule->is_active;
        $this->submoduleRepository->update($id, ['is_active' => $newStatus]);

        $updatedSubmodule = $this->submoduleRepository->findById($id);

        return $this->formatSubmoduleResponse($updatedSubmodule);
    }

    /**
     * Reordenar submódulos
     */
    public function reorderSubmodules(array $submoduleIds): bool
    {
        foreach ($submoduleIds as $order => $submoduleId) {
            $this->submoduleRepository->update($submoduleId, ['order' => $order + 1]);
        }

        return true;
    }

    /**
     * Formatear respuesta del submódulo
     */
    private function formatSubmoduleResponse($submodule): array
    {
        return [
            'id' => $submodule->id,
            'module_id' => $submodule->module_id,
            'parent_submodule_id' => $submodule->parent_submodule_id,
            'name' => $submodule->name,
            'slug' => $submodule->slug,
            'description' => $submodule->description,
            'icon' => $submodule->icon,
            'route' => $submodule->route,
            'order' => $submodule->order,
            'is_active' => $submodule->is_active,
            'level' => $submodule->level,
            'child_submodules' => $submodule->childSubmodules ? $submodule->childSubmodules->map(function ($child) {
                return [
                    'id' => $child->id,
                    'name' => $child->name,
                    'slug' => $child->slug,
                    'description' => $child->description,
                    'icon' => $child->icon,
                    'route' => $child->route,
                    'order' => $child->order,
                    'is_active' => $child->is_active,
                    'level' => $child->level,
                ];
            }) : [],
            'created_at' => $submodule->created_at,
            'updated_at' => $submodule->updated_at,
        ];
    }
}
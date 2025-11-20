<?php

namespace App\Services;

use App\Repositories\ModuleRepository;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Str;

class ModuleService
{
    protected ModuleRepository $moduleRepository;

    public function __construct(ModuleRepository $moduleRepository)
    {
        $this->moduleRepository = $moduleRepository;
    }

    /**
     * Obtener todos los módulos
     */
    public function getAllModules(): Collection
    {
        return $this->moduleRepository->getAll();
    }

    /**
     * Obtener todos los módulos activos
     */
    public function getActiveModules(): Collection
    {
        return $this->moduleRepository->getAllActive();
    }

    /**
     * Obtener módulos con estructura completa (submódulos anidados)
     */
    public function getModulesWithStructure(): Collection
    {
        return $this->moduleRepository->getAllActiveWithSubmodules();
    }

    /**
     * Obtener módulos por usuario
     */
    public function getModulesByUser(int $userId)
    {
        return $this->moduleRepository->getActiveByUserWithSubmodules($userId);
    }

    
    /**
     * Obtener módulos para asignación de permisos (por usuario o todos)
     */
    public function getModulesForPermissionAssignment(int $userId): Collection
    {
        return $this->moduleRepository->getForUserOrAll($userId);
    }

    /**
     * Obtener un módulo por ID
     */
    public function getModuleById(int $id): ?array
    {
        $module = $this->moduleRepository->findByIdWithSubmodules($id);
        
        if (!$module) {
            return null;
        }

        return $this->formatModuleResponse($module);
    }

    /**
     * Crear un nuevo módulo
     */
    public function createModule(array $data): array
    {
        // Generar slug si no viene
        if (!isset($data['slug']) || empty($data['slug'])) {
            $data['slug'] = Str::slug($data['name']);
        }

        // Validar que el slug sea único
        if ($this->moduleRepository->slugExists($data['slug'])) {
            throw new \Exception('El slug ya existe. Por favor elige otro nombre.');
        }

        // Asignar order si no viene
        if (!isset($data['order'])) {
            $data['order'] = $this->moduleRepository->getMaxOrder() + 1;
        }

        // Valores por defecto
        $data['is_active'] = $data['is_active'] ?? true;

        $module = $this->moduleRepository->create($data);

        return $this->formatModuleResponse($module);
    }

    /**
     * Actualizar un módulo
     */
    public function updateModule(int $id, array $data): array
    {
        $module = $this->moduleRepository->findById($id);

        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        // Si se actualiza el nombre y no el slug, regenerar slug
        if (isset($data['name']) && (!isset($data['slug']) || empty($data['slug']))) {
            $data['slug'] = Str::slug($data['name']);
        }

        // Validar slug único (excluyendo el módulo actual)
        if (isset($data['slug']) && $this->moduleRepository->slugExists($data['slug'], $id)) {
            throw new \Exception('El slug ya existe. Por favor elige otro nombre.');
        }

        $this->moduleRepository->update($id, $data);

        $updatedModule = $this->moduleRepository->findById($id);

        return $this->formatModuleResponse($updatedModule);
    }

    /**
     * Eliminar un módulo
     */
    public function deleteModule(int $id): bool
    {
        $module = $this->moduleRepository->findById($id);

        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        return $this->moduleRepository->delete($id);
    }

    /**
     * Activar/Desactivar un módulo
     */
    public function toggleModuleStatus(int $id): array
    {
        $module = $this->moduleRepository->findById($id);

        if (!$module) {
            throw new \Exception('Módulo no encontrado.');
        }

        $newStatus = !$module->is_active;
        $this->moduleRepository->update($id, ['is_active' => $newStatus]);

        $updatedModule = $this->moduleRepository->findById($id);

        return $this->formatModuleResponse($updatedModule);
    }

    /**
     * Reordenar módulos
     */
    public function reorderModules(array $moduleIds): bool
    {
        foreach ($moduleIds as $order => $moduleId) {
            $this->moduleRepository->update($moduleId, ['order' => $order + 1]);
        }

        return true;
    }

    /**
     * Formatear respuesta del módulo
     */
    private function formatModuleResponse($module): array
    {
        return [
            'id' => $module->id,
            'name' => $module->name,
            'slug' => $module->slug,
            'description' => $module->description,
            'icon' => $module->icon,
            'route' => $module->route,
            'order' => $module->order,
            'is_active' => $module->is_active,
            'submodules' => $module->submodules ? $module->submodules->map(function ($sub) {
                return [
                    'id' => $sub->id,
                    'name' => $sub->name,
                    'slug' => $sub->slug,
                    'description' => $sub->description,
                    'icon' => $sub->icon,
                    'route' => $sub->route,
                    'order' => $sub->order,
                    'is_active' => $sub->is_active,
                    'level' => $sub->level,
                    'child_submodules' => $sub->childSubmodules ?? [],
                ];
            }) : [],
            'created_at' => $module->created_at,
            'updated_at' => $module->updated_at,
        ];
    }
}
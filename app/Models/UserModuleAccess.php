<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserModuleAccess extends Model
{
    use HasFactory;

    protected $table = 'user_module_access';

    protected $fillable = [
        'user_id',
        'module_id',
        'submodule_id',
        'subsubmodule_id',
        'can_view',
        'can_create',
        'can_edit',
        'can_delete',
    ];

    protected $casts = [
        'user_id' => 'integer',
        'module_id' => 'integer',
        'submodule_id' => 'integer',
        'subsubmodule_id' => 'integer',
        'can_view' => 'boolean',
        'can_create' => 'boolean',
        'can_edit' => 'boolean',
        'can_delete' => 'boolean',
    ];

    /**
     * Relación con el usuario
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Relación con el módulo
     */
    public function module(): BelongsTo
    {
        return $this->belongsTo(Module::class);
    }

    /**
     * Relación con el submódulo
     */
    public function submodule(): BelongsTo
    {
        return $this->belongsTo(Submodule::class);
    }

    /**
     * Relación con el subsubmódulo
     */
    public function subsubmodule(): BelongsTo
    {
        return $this->belongsTo(Submodule::class, 'subsubmodule_id');
    }

    /**
     * Scope para filtrar por usuario
     */
    public function scopeForUser($query, int $userId)
    {
        return $query->where('user_id', $userId);
    }

    /**
     * Scope para obtener solo permisos con acceso de vista
     */
    public function scopeCanView($query)
    {
        return $query->where('can_view', true);
    }

    /**
     * Scope para obtener permisos de módulo específico
     */
    public function scopeForModule($query, int $moduleId)
    {
        return $query->where('module_id', $moduleId);
    }

    /**
     * Scope para obtener permisos de submódulo específico
     */
    public function scopeForSubmodule($query, int $submoduleId)
    {
        return $query->where('submodule_id', $submoduleId);
    }

    /**
     * Verifica si tiene algún permiso activo
     */
    public function hasAnyPermission(): bool
    {
        return $this->can_view || $this->can_create || $this->can_edit || $this->can_delete;
    }

    /**
     * Verifica si tiene todos los permisos
     */
    public function hasFullPermissions(): bool
    {
        return $this->can_view && $this->can_create && $this->can_edit && $this->can_delete;
    }
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Submodule extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'module_id',
        'parent_submodule_id',
        'name',
        'slug',
        'description',
        'icon',
        'route',
        'order',
        'is_active',
        'level',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'order' => 'integer',
        'level' => 'integer',
        'module_id' => 'integer',
        'parent_submodule_id' => 'integer',
    ];

    /**
     * Relación con el módulo padre
     */
    public function module(): BelongsTo
    {
        return $this->belongsTo(Module::class);
    }

    /**
     * Relación con el submódulo padre (para anidación)
     */
    public function parentSubmodule(): BelongsTo
    {
        return $this->belongsTo(Submodule::class, 'parent_submodule_id');
    }

    /**
     * Relación con submódulos hijos (subsubmódulos)
     */
  public function childSubmodules()
{
    return $this->hasMany(Submodule::class, 'parent_submodule_id')
                ->with('childSubmodules') // recursivo
                ->orderBy('order');
}


    /**
     * Relación con permisos de acceso de usuarios
     */
    public function userAccess(): HasMany
    {
        return $this->hasMany(UserModuleAccess::class);
    }

    /**
     * Scope para obtener solo submódulos activos
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope para ordenar por el campo order
     */
    public function scopeOrdered($query)
    {
        return $query->orderBy('order');
    }

    /**
     * Scope para obtener solo submódulos de primer nivel (sin padre)
     */
    public function scopeFirstLevel($query)
    {
        return $query->whereNull('parent_submodule_id');
    }

    /**
     * Scope para obtener submódulos por nivel específico
     */
    public function scopeByLevel($query, int $level)
    {
        return $query->where('level', $level);
    }
    public function scopeVisibleForUser($query, int $userId)
{
    return $query->whereHas('userAccess', function ($q) use ($userId) {
        $q->where('user_id', $userId)
          ->where('can_view', true);
    });
}

}
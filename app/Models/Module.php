<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Module extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'slug',
        'description',
        'icon',
        'route',
        'order',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'order' => 'integer',
    ];

    /**
     * Relación con submódulos
     */
    public function submodules(): HasMany
    {
        return $this->hasMany(Submodule::class)->orderBy('order');
    }

    /**
     * Relación con permisos de acceso de usuarios
     */
    public function userAccess(): HasMany
    {
        return $this->hasMany(UserModuleAccess::class);
    }

    /**
     * Scope para obtener solo módulos activos
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
}
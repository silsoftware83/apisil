<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Departamento extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',
        'codigo',
        'descripcion',
        'jefe_id',
        'activo',
    ];

    protected $casts = [
        'activo' => 'boolean',
    ];

    /**
     * Relación con el jefe del departamento (Personal)
     */
    public function jefe(): BelongsTo
    {
        return $this->belongsTo(Personal::class, 'jefe_id');
    }

    /**
     * Relación con los puestos del departamento
     */
    public function puestos(): HasMany
    {
        return $this->hasMany(Puesto::class);
    }

    /**
     * Relación con el personal del departamento
     */
    public function personal(): HasMany
    {
        return $this->hasMany(Personal::class);
    }

    /**
     * Scope para departamentos activos
     */
    public function scopeActivos($query)
    {
        return $query->where('activo', true);
    }
}
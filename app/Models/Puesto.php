<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Puesto extends Model
{
    use HasFactory;

    protected $fillable = [
        'departamento_id',
        'nombre',
        'codigo',
        'nivel',
        'descripcion',
        'salario_min',
        'salario_max',
        'activo',
    ];

    protected $casts = [
        'salario_min' => 'decimal:2',
        'salario_max' => 'decimal:2',
        'activo' => 'boolean',
    ];

    /**
     * Relación con el departamento
     */
    public function departamento(): BelongsTo
    {
        return $this->belongsTo(Departamento::class);
    }

    /**
     * Relación con el personal que ocupa este puesto
     */
    public function personal(): HasMany
    {
        return $this->hasMany(Personal::class);
    }

    /**
     * Scope para puestos activos
     */
    public function scopeActivos($query)
    {
        return $query->where('activo', true);
    }

    /**
     * Scope para filtrar por nivel
     */
    public function scopePorNivel($query, $nivel)
    {
        return $query->where('nivel', $nivel);
    }

    /**
     * Accessor para el rango salarial formateado
     */
    public function getRangoSalarialAttribute(): string
    {
        if ($this->salario_min && $this->salario_max) {
            return '$' . number_format($this->salario_min, 2) . ' - $' . number_format($this->salario_max, 2);
        }
        return 'No especificado';
    }
}
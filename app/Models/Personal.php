<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Personal extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'personal';

    protected $fillable = [
        // Datos personales
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'correo_electronico',
        'telefono',
        'telefono_emergencia',
        'fecha_nacimiento',
        'sexo',
        'estado_civil',
        'nacionalidad',
        
        // Domicilio
        'direccion',
        'colonia',
        'ciudad',
        'estado',
        'pais',
        'codigo_postal',
        
        // Datos laborales
        'departamento_id',
        'puesto_id',
        'fecha_contratacion',
        'fecha_baja',
        'salario',
        'bono',
        'tipo_contrato',
        'turno',
        'estatus',
        'dias_vacaciones',
        'dias_restantes_vacaciones',
        
        // Datos fiscales
        'nss',
        'rfc',
        'curp',
        'infonavit',
        'numero_empleado',
        'banco',
        'numero_cuenta',
        'clabe_interbancaria',
        
        // Información adicional
        'foto',
        'observaciones',
        'es_supervisor',
        'tiene_acceso_sistema',
        'usuario_id',
        
        // Auditoría
        'creado_por',
        'actualizado_por',
    ];

    protected $casts = [
        'fecha_nacimiento' => 'date',
        'fecha_contratacion' => 'date',
        'fecha_baja' => 'date',
        'salario' => 'decimal:2',
        'bono' => 'decimal:2',
        'es_supervisor' => 'boolean',
        'tiene_acceso_sistema' => 'boolean',
        'dias_vacaciones' => 'integer',
        'dias_restantes_vacaciones' => 'integer',
    ];

    protected $hidden = [
        'nss',
        'rfc',
        'curp',
        'numero_cuenta',
        'clabe_interbancaria',
    ];

    // Relaciones
    public function departamento(): BelongsTo
    {
        return $this->belongsTo(Departamento::class, 'departamento_id');
    }

    public function puesto(): BelongsTo
    {
        return $this->belongsTo(Puesto::class, 'puesto_id');
    }

    public function usuario(): BelongsTo
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }

    public function creadoPor(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creado_por');
    }

    public function actualizadoPor(): BelongsTo
    {
        return $this->belongsTo(User::class, 'actualizado_por');
    }

    // Scopes
    public function scopeActivos($query)
    {
        return $query->where('estatus', 'activo');
    }

    public function scopeInactivos($query)
    {
        return $query->where('estatus', 'inactivo');
    }

    public function scopeBaja($query)
    {
        return $query->where('estatus', 'baja');
    }

    public function scopeSupervisores($query)
    {
        return $query->where('es_supervisor', true);
    }

    public function scopePorDepartamento($query, $departamentoId)
    {
        return $query->where('departamento_id', $departamentoId);
    }

    public function scopePorPuesto($query, $puestoId)
    {
        return $query->where('puesto_id', $puestoId);
    }

    // Accessors
    public function getNombreCompletoAttribute(): string
    {
        return trim("{$this->nombre} {$this->apellido_paterno} {$this->apellido_materno}");
    }

    public function getDireccionCompletaAttribute(): string
    {
        $partes = array_filter([
            $this->direccion,
            $this->colonia,
            $this->ciudad,
            $this->estado,
            $this->codigo_postal,
            $this->pais,
        ]);

        return implode(', ', $partes);
    }

    public function getAntiguedadAttribute(): ?int
    {
        if (!$this->fecha_contratacion) {
            return null;
        }

        $fechaFin = $this->fecha_baja ?? now();
        return $this->fecha_contratacion->diffInYears($fechaFin);
    }

    public function getEdadAttribute(): ?int
    {
        return $this->fecha_nacimiento?->age;
    }

    // Métodos auxiliares
    public function estaActivo(): bool
    {
        return $this->estatus === 'activo';
    }

    public function tieneVacacionesDisponibles(): bool
    {
        return $this->dias_restantes_vacaciones > 0;
    }

    public function puedeAccederAlSistema(): bool
    {
        return $this->tiene_acceso_sistema && $this->usuario_id !== null;
    }
}
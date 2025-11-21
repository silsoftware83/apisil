<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Personal extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'personal';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'actualContract',
        'dateContractFinish',
        'name',
        'lastName',
        'activo',
        'id_check',
        'direction',
        'cp',
        'phone',
        'birthday',
        'rfc',
        'curp',
        'nss',
        'school',
        'ine',
        'alergist',
        'personalContact',
        'phoneContact',
        'empresa',
        'puesto',
        'ingreso',
        'id_empleado',
        'id_jefe_inmediato',
        'id_departamento',
        'inmBoss',
        'wArea',
        'infonavit',
        'numCart',
        'company',
        'idLicNum',
        'documents',
        'contracts',
        'documentsCompany',
        'removeColaborator',
        'img',
        'numExt',
        'utalla',
        'numCarttwo',
        'email',
        'emailCompany',
        'checkCode',
        'ext_tel',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'dateContractFinish' => 'date',
        'id_check' => 'date',
        'birthday' => 'date',
        'ingreso' => 'date',
        'activo' => 'integer',
        'cp' => 'integer',
        'id_empleado' => 'integer',
        'id_jefe_inmediato' => 'integer',
        'id_departamento' => 'integer',
        'contracts' => 'array', // Para manejar el JSON automáticamente
    ];

    /**
     * Relación: Jefe inmediato (self-referencing)
     */
    public function jefeInmediato()
    {
        return $this->belongsTo(Personal::class, 'id_jefe_inmediato');
    }

    /**
     * Relación: Empleados que reportan a este jefe
     */
    public function subordinados()
    {
        return $this->hasMany(Personal::class, 'id_jefe_inmediato');
    }

    /**
     * Scope: Solo empleados activos
     */
    public function scopeActivos($query)
    {
        return $query->where('activo', 1);
    }

    /**
     * Scope: Por empresa
     */
    public function scopePorEmpresa($query, $empresa)
    {
        return $query->where('empresa', $empresa);
    }

    /**
     * Scope: Por departamento
     */
    public function scopePorDepartamento($query, $idDepartamento)
    {
        return $query->where('id_departamento', $idDepartamento);
    }

    /**
     * Accessor: Nombre completo
     */
    public function getNombreCompletoAttribute()
    {
        return "{$this->name} {$this->lastName}";
    }

    /**
     * Accessor: Años de antigüedad
     */
    public function getAntiguedadAttribute()
    {
        if (!$this->ingreso) {
            return null;
        }
        return now()->diffInYears($this->ingreso);
    }

    /**
     * Accessor: Edad
     */
    public function getEdadAttribute()
    {
        if (!$this->birthday) {
            return null;
        }
        return now()->diffInYears($this->birthday);
    }
}
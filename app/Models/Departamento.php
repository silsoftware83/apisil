<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Departamento extends Model
{
    use HasFactory;

    protected $table = 'departamentos';

    protected $fillable = [
        'nombre',
        'descripcion',
        'id_jefe_area'
    ];

    /**
     * Jefe del área (un empleado)
     */
    public function jefeArea()
    {
        return $this->belongsTo(Personal::class, 'id_jefe_area');
    }

    /**
     * Personal que pertenece al departamento
     */
    public function empleados()
    {
        return $this->hasMany(Personal::class, 'id_departamento');
    }
}

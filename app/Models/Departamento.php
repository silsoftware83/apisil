<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Puesto;
use App\Models\Personal;

class Departamento extends Model
{
    use HasFactory;

    protected $table = 'departamentos';

    protected $fillable = [
        'nombre',
        'descripcion',
        'id_jefe_area',

    ];

    /**
     * Jefe del área (un empleado)
     */
    public function jefe()
    {
        return $this->belongsTo(Personal::class, 'id_jefe_area');
    }

    public function puestos()
    {
        return $this->hasMany(Puesto::class, 'id_departamento');
    }
    /**
     * Personal que pertenece al departamento
     */
    public function personal()
    {
        return $this->hasMany(Personal::class, 'id_departamento');
    }
}

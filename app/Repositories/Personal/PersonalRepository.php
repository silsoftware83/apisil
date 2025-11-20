<?php

namespace App\Repositories\Personal;

use App\Models\Personal;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class PersonalRepository
{
    public function __construct(
        protected Personal $model
    ) {}

    /**
     * Obtener todos los registros de personal
     */
    public function getAll(): Collection
    {
        return $this->model->with(['departamento', 'puesto'])->get();
    }

    /**
     * Obtener personal paginado
     */
    public function paginate(int $perPage = 15, array $filters = []): LengthAwarePaginator
    {
        $query = $this->model->with(['departamento', 'puesto', 'usuario']);

        $query = $this->applyFilters($query, $filters);

        return $query->latest()->paginate($perPage);
    }

    /**
     * Encontrar por ID
     */
    public function findById(int $id): ?Personal
    {
        return $this->model->with(['departamento', 'puesto', 'usuario'])->find($id);
    }

    /**
     * Encontrar por número de empleado
     */
    public function findByNumeroEmpleado(string $numeroEmpleado): ?Personal
    {
        return $this->model->where('numero_empleado', $numeroEmpleado)->first();
    }

    /**
     * Encontrar por correo electrónico
     */
    public function findByEmail(string $email): ?Personal
    {
        return $this->model->where('correo_electronico', $email)->first();
    }

    /**
     * Crear nuevo personal
     */
    public function create(array $data): Personal
    {
       
        return $this->model->create($data);
    }

    /**
     * Actualizar personal
     */
    public function update(int $id, array $data): bool
    {
        $personal = $this->findById($id);
        
        if (!$personal) {
            return false;
        }

        return $personal->update($data);
    }

    /**
     * Eliminar personal (soft delete)
     */
    public function delete(int $id): bool
    {
        $personal = $this->findById($id);
        
        if (!$personal) {
            return false;
        }

        return $personal->delete();
    }

    /**
     * Restaurar personal eliminado
     */
    public function restore(int $id): bool
    {
        return $this->model->withTrashed()->find($id)?->restore() ?? false;
    }

    /**
     * Obtener personal activo
     */
    public function getActivos(): Collection
    {
        return $this->model->activos()
            ->with(['departamento', 'puesto'])
            ->get();
    }

    /**
     * Obtener personal por departamento
     */
    public function getByDepartamento(int $departamentoId): Collection
    {
        return $this->model->porDepartamento($departamentoId)
            ->with(['puesto'])
            ->get();
    }

    /**
     * Obtener personal por puesto
     */
    public function getByPuesto(int $puestoId): Collection
    {
        return $this->model->porPuesto($puestoId)
            ->with(['departamento'])
            ->get();
    }

    /**
     * Obtener supervisores
     */
    public function getSupervisores(): Collection
    {
        return $this->model->supervisores()
            ->activos()
            ->with(['departamento', 'puesto'])
            ->get();
    }

    /**
     * Buscar personal
     */
    public function search(string $term): Collection
    {
        return $this->model->where(function ($query) use ($term) {
            $query->where('nombre', 'LIKE', "%{$term}%")
                ->orWhere('apellido_paterno', 'LIKE', "%{$term}%")
                ->orWhere('apellido_materno', 'LIKE', "%{$term}%")
                ->orWhere('numero_empleado', 'LIKE', "%{$term}%")
                ->orWhere('correo_electronico', 'LIKE', "%{$term}%");
        })
        ->with(['departamento', 'puesto'])
        ->get();
    }

    /**
     * Contar personal activo
     */
    public function countActivos(): int
    {
        return $this->model->activos()->count();
    }

    /**
     * Obtener personal con cumpleaños en el mes
     */
    public function getCumpleanerosMes(int $mes = null): Collection
    {
        $mes = $mes ?? now()->month;

        return $this->model->activos()
            ->whereMonth('fecha_nacimiento', $mes)
            ->orderByRaw('DAY(fecha_nacimiento)')
            ->get();
    }

    /**
     * Obtener personal con vacaciones disponibles
     */
    public function getConVacacionesDisponibles(): Collection
    {
        return $this->model->activos()
            ->where('dias_restantes_vacaciones', '>', 0)
            ->orderBy('dias_restantes_vacaciones', 'desc')
            ->get();
    }

    /**
     * Actualizar días de vacaciones
     */
    public function actualizarVacaciones(int $id, int $diasUsados): bool
    {
        $personal = $this->findById($id);

        if (!$personal || $personal->dias_restantes_vacaciones < $diasUsados) {
            return false;
        }

        return $personal->update([
            'dias_restantes_vacaciones' => $personal->dias_restantes_vacaciones - $diasUsados
        ]);
    }

    /**
     * Dar de baja a personal
     */
    public function darDeBaja(int $id, string $fechaBaja = null): bool
    {
        $personal = $this->findById($id);

        if (!$personal) {
            return false;
        }

        return $personal->update([
            'estatus' => 'baja',
            'fecha_baja' => $fechaBaja ?? now(),
        ]);
    }

    /**
     * Obtener estadísticas generales
     */
    public function getEstadisticas(): array
    {
        return [
            'total' => $this->model->count(),
            'activos' => $this->model->activos()->count(),
            'inactivos' => $this->model->inactivos()->count(),
            'baja' => $this->model->baja()->count(),
            'supervisores' => $this->model->supervisores()->count(),
            'por_departamento' => $this->model->activos()
                ->select('departamento_id', DB::raw('count(*) as total'))
                ->groupBy('departamento_id')
                ->with('departamento:id,nombre')
                ->get(),
            'por_tipo_contrato' => $this->model->activos()
                ->select('tipo_contrato', DB::raw('count(*) as total'))
                ->groupBy('tipo_contrato')
                ->get(),
        ];
    }

    /**
     * Aplicar filtros a la consulta
     */
    protected function applyFilters($query, array $filters)
    {
        if (isset($filters['estatus'])) {
            $query->where('estatus', $filters['estatus']);
        }

        if (isset($filters['departamento_id'])) {
            $query->where('departamento_id', $filters['departamento_id']);
        }

        if (isset($filters['puesto_id'])) {
            $query->where('puesto_id', $filters['puesto_id']);
        }

        if (isset($filters['tipo_contrato'])) {
            $query->where('tipo_contrato', $filters['tipo_contrato']);
        }

        if (isset($filters['search'])) {
            $search = $filters['search'];
            $query->where(function ($q) use ($search) {
                $q->where('nombre', 'LIKE', "%{$search}%")
                    ->orWhere('apellido_paterno', 'LIKE', "%{$search}%")
                    ->orWhere('apellido_materno', 'LIKE', "%{$search}%")
                    ->orWhere('numero_empleado', 'LIKE', "%{$search}%");
            });
        }

        return $query;
    }
}
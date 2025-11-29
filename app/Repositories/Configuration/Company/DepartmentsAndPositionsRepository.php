<?php

namespace App\Repositories\Configuration\Company;

use App\Models\Departamento;
use App\Models\Puesto;
use App\Models\Personal;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class DepartmentsAndPositionsRepository
{
    /**
     * @var Departamento
     */
    protected $model;
    protected $modelPersonal;
    protected $modelPuesto;

    /**
     * DepartmentsAndPositionsRepository constructor.
     *
     * @param Departamento $model
     * @param Personal $modelPersonal
     * @param Puesto $modelPuesto
     */
    public function __construct(Departamento $model, Personal $modelPersonal, Puesto $modelPuesto)
    {
        $this->model = $model;
        $this->modelPersonal = $modelPersonal;
        $this->modelPuesto = $modelPuesto;
    }

    /**
     * Get all departments and positions
     *
     * @param array $relations
     * @return Collection
     */
    public function getAll(array $relations = []): Collection
    {
        return $this->model->with($relations)->get();
    }

    /**
     * Get paginated departments and positions
     *
     * @param int $perPage
     * @param array $relations
     * @return LengthAwarePaginator
     */
    public function paginate(int $perPage = 15, array $relations = []): LengthAwarePaginator
    {
        return $this->model->with($relations)->paginate($perPage);
    }

    /**
     * Find department and position by ID
     *
     * @param int $id
     * @param array $relations
     * @return Departamento|null
     */
    public function findById(int $id, array $relations = []): ?Departamento
    {
        return $this->model->with($relations)->find($id);
    }

    /**
     * Find department and position by ID or fail
     *
     * @param int $id
     * @param array $relations
     * @return Departamento
     */
    public function findByIdOrFail(int $id, array $relations = []): Departamento
    {
        return $this->model->with($relations)->findOrFail($id);
    }

    /**
     * Create a new department and position
     *
     * @param array $data
     * @return Departamento
     */
    public function create(array $data): Departamento
    {
        $depratamento = $this->model->create([
            'nombre' => $data['nombre'],
            'descripcion' => $data['descripcion'],
            'id_jefe_area' => $data['id_jefe_area'],
        ]);

        if ($depratamento['id'] > 0) {
            foreach ($data['positions'] as $puesto) {
                $this->modelPuesto->create([
                    'id_departamento' => $depratamento['id'],
                    'nombre' => $puesto['nombre'],
                    'descripcion' => $puesto['descripcion'],

                    'level' => $puesto['level'],
                ]);
            }
        }
        return $depratamento;
    }

    /**
     * Update department and position
     *
     * @param int $id
     * @param array $data
     * @return bool
     */
    public function update(int $id, array $data): bool
    {
        $record = $this->findByIdOrFail($id);
        return $record->update($data);
    }

    /**
     * Delete department and position
     *
     * @param int $id
     * @return bool
     */
    public function delete(int $id): bool
    {
        $record = $this->findByIdOrFail($id);
        return $record->delete();
    }

    /**
     * Find by specific column
     *
     * @param string $column
     * @param mixed $value
     * @param array $relations
     * @return Collection
     */
    public function findByColumn(string $column, $value, array $relations = []): Collection
    {
        return $this->model->with($relations)->where($column, $value)->get();
    }

    /**
     * Search departments and positions
     *
     * @param array $criteria
     * @param array $relations
     * @return Collection
     */
    public function search(array $criteria, array $relations = []): Collection
    {
        $query = $this->model->with($relations);

        foreach ($criteria as $key => $value) {
            if (is_array($value)) {
                $query->whereIn($key, $value);
            } else {
                $query->where($key, $value);
            }
        }

        return $query->get();
    }

    /**
     * Count all records
     *
     * @return int
     */
    public function count(): int
    {
        return $this->model->count();
    }

    /**
     * Check if exists
     *
     * @param int $id
     * @return bool
     */
    public function exists(int $id): bool
    {
        return $this->model->where('id', $id)->exists();
    }

    public function getActiveUsers(): Collection
    {
        return $this->modelPersonal->where('activo', true)->select('id', 'name', 'lastName')->get();
    }
}

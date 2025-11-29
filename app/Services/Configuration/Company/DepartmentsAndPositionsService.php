<?php

namespace App\Services\Configuration\Company;

use App\Repositories\Configuration\Company\DepartmentsAndPositionsRepository;
use App\Models\Departamento;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Exception;

class DepartmentsAndPositionsService
{
    /**
     * @var DepartmentsAndPositionsRepository
     */
    protected $repository;

    /**
     * DepartmentsAndPositionsService constructor.
     *
     * @param DepartmentsAndPositionsRepository $repository
     */
    public function __construct(DepartmentsAndPositionsRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Get all departments and positions
     *
     * @param array $relations
     * @return Collection
     */
    public function getAll(array $relations = []): Collection
    {
        try {
            return $this->repository->getAll($relations);
        } catch (Exception $e) {
            Log::error('Error getting all departments and positions: ' . $e->getMessage());
            throw $e;
        }
    }

    public function getActiveUsers(): Collection
    {
        try {
            return $this->repository->getActiveUsers();
        } catch (Exception $e) {
            Log::error('Error getting all active users: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Get paginated departments and positions
     *
     * @param int $perPage
     * @param array $relations
     * @return LengthAwarePaginator
     */
    public function getPaginated(int $perPage = 15, array $relations = []): LengthAwarePaginator
    {
        try {
            return $this->repository->paginate($perPage, $relations);
        } catch (Exception $e) {
            Log::error('Error getting paginated departments and positions: ' . $e->getMessage());
            throw $e;
        }
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
        try {
            return $this->repository->findById($id, $relations);
        } catch (Exception $e) {
            Log::error("Error finding department and position by ID {$id}: " . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Create a new department and position
     *
     * @param array $data
     * @return Departamento
     */
    public function create(array $data): Departamento
    {
        DB::beginTransaction();

        try {
            // Aquí puedes agregar validaciones de negocio adicionales
            $this->validateData($data);

            // Aquí puedes procesar los datos antes de crear
            $processedData = $this->processDataForCreate($data);

            $departmentPosition = $this->repository->create($processedData);

            DB::commit();

            Log::info("Department and position created successfully with ID: {$departmentPosition->id}");

            return $departmentPosition;
        } catch (Exception $e) {
            DB::rollBack();
            Log::error('Error creating department and position: ' . $e->getMessage());
            throw $e;
        }
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
        DB::beginTransaction();

        try {
            // Verificar que existe
            $this->repository->findByIdOrFail($id);

            // Validar datos
            $this->validateData($data, $id);

            // Procesar datos
            $processedData = $this->processDataForUpdate($data);

            $result = $this->repository->update($id, $processedData);

            DB::commit();

            Log::info("Department and position updated successfully with ID: {$id}");

            return $result;
        } catch (Exception $e) {
            DB::rollBack();
            Log::error("Error updating department and position with ID {$id}: " . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Delete department and position
     *
     * @param int $id
     * @return bool
     */
    public function delete(int $id): bool
    {
        DB::beginTransaction();

        try {
            // Verificar que existe
            $this->repository->findByIdOrFail($id);

            // Aquí puedes agregar validaciones antes de eliminar
            $this->validateDelete($id);

            $result = $this->repository->delete($id);

            DB::commit();

            Log::info("Department and position deleted successfully with ID: {$id}");

            return $result;
        } catch (Exception $e) {
            DB::rollBack();
            Log::error("Error deleting department and position with ID {$id}: " . $e->getMessage());
            throw $e;
        }
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
        try {
            return $this->repository->search($criteria, $relations);
        } catch (Exception $e) {
            Log::error('Error searching departments and positions: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Get count of all records
     *
     * @return int
     */
    public function getCount(): int
    {
        try {
            return $this->repository->count();
        } catch (Exception $e) {
            Log::error('Error counting departments and positions: ' . $e->getMessage());
            throw $e;
        }
    }

    /**
     * Validate data for create/update
     *
     * @param array $data
     * @param int|null $id
     * @return void
     * @throws Exception
     */
    protected function validateData(array $data, ?int $id = null): void
    {
        if (empty($data['nombre'])) {
            throw new Exception('Name is required');
        }
        if (empty($data['manager']) || !is_numeric($data['manager'])) {
            throw new Exception('Manager is required');
        }
        if (count($data['puestos']) == 0) {
            throw new Exception('Positions are required');
        }
    }

    /**
     * Process data before creating
     *
     * @param array $data
     * @return array
     */
    protected function processDataForCreate(array $data): array
    {
        $data['nombre'] = $data['nombre'];
        $data['descripcion'] = $data['descripcion'];
        $data['id_jefe_area'] = $data['manager'];

        $data['positions'] = $data['puestos'];

        return $data;
    }

    /**
     * Process data before updating
     *
     * @param array $data
     * @return array
     */
    protected function processDataForUpdate(array $data): array
    {
        // Aquí puedes transformar o procesar los datos antes de actualizar

        return $data;
    }

    /**
     * Validate before delete
     *
     * @param int $id
     * @return void
     * @throws Exception
     */
    protected function validateDelete(int $id): void
    {
        // Implementa validaciones antes de eliminar
        // Ejemplo: verificar que no tiene relaciones activas
    }
}

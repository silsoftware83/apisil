<?php

namespace App\Services\Personal;

use App\Models\Personal;
use App\Repositories\Personal\PersonalRepository;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Exception;

class PersonalService
{
    public function __construct(
        protected PersonalRepository $repository
    ) {}

    /**
     * Listar personal paginado
     */
    public function listar(int $perPage = 5, array $filters = []): LengthAwarePaginator
    {
        return $this->repository->paginate($perPage, $filters);
    }

    /**
     * Obtener todos los registros activos
     */
    public function obtenerActivos(): Collection
    {
        return $this->repository->getActivos();
    }

    /**
     * Obtener por ID
     */
    public function obtenerPorId(int $id): ?Personal
    {
        return $this->repository->findById($id);
    }

    /**
     * Crear nuevo personal
     */
    public function crear(array $datos): Personal
    {
        DB::beginTransaction();

        try {
            // Generar número de empleado si no viene
            if (empty($datos['numero_empleado'])) {
                $datos['numero_empleado'] = $this->generarNumeroEmpleado();
            }

            // Calcular días de vacaciones según antigüedad (ejemplo)
            if (empty($datos['dias_vacaciones']) && !empty($datos['fecha_contratacion'])) {
                $datos['dias_vacaciones'] = $this->calcularDiasVacaciones($datos['fecha_contratacion']);
                $datos['dias_restantes_vacaciones'] = $datos['dias_vacaciones'];
            }

            // Procesar foto si existe
            if (isset($datos['foto']) && $datos['foto'] instanceof \Illuminate\Http\UploadedFile) {
                $datos['foto'] = $this->guardarFoto($datos['foto']);
            }

            // Establecer usuario que crea
            if (auth()->check()) {
                $datos['creado_por'] = auth()->id();
            }

            $personal = $this->repository->create($datos);

            DB::commit();

            return $personal;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Actualizar personal
     */
    public function actualizar(int $id, array $datos): bool
    {
        DB::beginTransaction();

        try {
            $personal = $this->repository->findById($id);

            if (!$personal) {
                throw new Exception('Personal no encontrado');
            }

            // Procesar foto si existe
            if (isset($datos['foto']) && $datos['foto'] instanceof \Illuminate\Http\UploadedFile) {
                // Eliminar foto anterior
                if ($personal->foto) {
                    Storage::disk('public')->delete($personal->foto);
                }
                $datos['foto'] = $this->guardarFoto($datos['foto']);
            }

            // Establecer usuario que actualiza
            if (auth()->check()) {
                $datos['actualizado_por'] = auth()->id();
            }

            $resultado = $this->repository->update($id, $datos);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Eliminar personal
     */
    public function eliminar(int $id): bool
    {
        DB::beginTransaction();

        try {
            $personal = $this->repository->findById($id);

            if (!$personal) {
                throw new Exception('Personal no encontrado');
            }

            $resultado = $this->repository->delete($id);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Dar de baja a personal
     */
    public function darDeBaja(int $id, array $datos = []): bool
    {
        DB::beginTransaction();

        try {
            $fechaBaja = $datos['fecha_baja'] ?? now();
            $resultado = $this->repository->darDeBaja($id, $fechaBaja);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Reactivar personal
     */
    public function reactivar(int $id): bool
    {
        DB::beginTransaction();

        try {
            $resultado = $this->repository->update($id, [
                'estatus' => 'activo',
                'fecha_baja' => null,
                'actualizado_por' => auth()->id(),
            ]);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Buscar personal
     */
    public function buscar(string $termino): Collection
    {
        return $this->repository->search($termino);
    }

    /**
     * Obtener por departamento
     */
    public function obtenerPorDepartamento(int $departamentoId): Collection
    {
        return $this->repository->getByDepartamento($departamentoId);
    }

    /**
     * Obtener supervisores
     */
    public function obtenerSupervisores(): Collection
    {
        return $this->repository->getSupervisores();
    }

    /**
     * Obtener cumpleañeros del mes
     */
    public function obtenerCumpleanerosMes(int $mes = null): Collection
    {
        return $this->repository->getCumpleanerosMes($mes);
    }

    /**
     * Solicitar vacaciones
     */
    public function solicitarVacaciones(int $id, int $diasSolicitados): bool
    {
        DB::beginTransaction();

        try {
            $personal = $this->repository->findById($id);

            if (!$personal) {
                throw new Exception('Personal no encontrado');
            }

            if ($personal->dias_restantes_vacaciones < $diasSolicitados) {
                throw new Exception('No tiene suficientes días de vacaciones disponibles');
            }

            $resultado = $this->repository->actualizarVacaciones($id, $diasSolicitados);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Restablecer vacaciones anuales
     */
    public function restablecerVacaciones(int $id): bool
    {
        DB::beginTransaction();

        try {
            $personal = $this->repository->findById($id);

            if (!$personal || !$personal->fecha_contratacion) {
                throw new Exception('No se puede calcular las vacaciones');
            }

            $diasVacaciones = $this->calcularDiasVacaciones($personal->fecha_contratacion);

            $resultado = $this->repository->update($id, [
                'dias_vacaciones' => $diasVacaciones,
                'dias_restantes_vacaciones' => $diasVacaciones,
                'actualizado_por' => auth()->id(),
            ]);

            DB::commit();

            return $resultado;
        } catch (Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    /**
     * Obtener estadísticas
     */
    public function obtenerEstadisticas(): array
    {
        return $this->repository->getEstadisticas();
    }

    /**
     * Validar si el número de empleado existe
     */
    public function existeNumeroEmpleado(string $numeroEmpleado, ?int $exceptoId = null): bool
    {
        $personal = $this->repository->findByNumeroEmpleado($numeroEmpleado);

        if (!$personal) {
            return false;
        }

        if ($exceptoId && $personal->id === $exceptoId) {
            return false;
        }

        return true;
    }

    /**
     * Validar si el correo existe
     */
    public function existeCorreo(string $email, ?int $exceptoId = null): bool
    {
        $personal = $this->repository->findByEmail($email);

        if (!$personal) {
            return false;
        }

        if ($exceptoId && $personal->id === $exceptoId) {
            return false;
        }

        return true;
    }

    /**
     * Generar número de empleado único
     */
    protected function generarNumeroEmpleado(): string
    {
        do {
            $numero = 'EMP' . str_pad(rand(1, 99999), 5, '0', STR_PAD_LEFT);
        } while ($this->existeNumeroEmpleado($numero));

        return $numero;
    }

    /**
     * Calcular días de vacaciones según antigüedad (Ley Federal del Trabajo - México)
     */
    protected function calcularDiasVacaciones(string $fechaContratacion): int
    {
        $antiguedad = now()->diffInYears($fechaContratacion);

        return match (true) {
            $antiguedad < 1 => 12,
            $antiguedad === 1 => 14,
            $antiguedad === 2 => 16,
            $antiguedad === 3 => 18,
            $antiguedad === 4 => 20,
            $antiguedad >= 5 && $antiguedad <= 9 => 22,
            $antiguedad >= 10 && $antiguedad <= 14 => 24,
            $antiguedad >= 15 && $antiguedad <= 19 => 26,
            $antiguedad >= 20 && $antiguedad <= 24 => 28,
            $antiguedad >= 25 && $antiguedad <= 29 => 30,
            default => 32,
        };
    }

    /**
     * Guardar foto de personal
     */
    protected function guardarFoto(\Illuminate\Http\UploadedFile $foto): string
    {
        return $foto->store('personal/fotos', 'public');
    }
}
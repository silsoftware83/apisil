<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Services\ModuleService;
class AuthController extends Controller
{
    protected ModuleService $moduleService;

    public function __construct(ModuleService $moduleService)
    {
        $this->moduleService = $moduleService;
    }

    // LOGIN
    public function login(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required'
        ]);

        $user = User::where('email', $request->email)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Credenciales incorrectas'
            ], 401);
        }

        // Eliminamos tokens anteriores (opcional)
        $user->tokens()->delete();

        // Creamos token
        $token = $user->createToken('auth_token')->plainTextToken;
        // Obtener módulos con permisos del usuario
        $modules = $this->moduleService->getModulesByUser($user->id);
       

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
            'modules' => $modules,
        ]);
    }

    // PERFIL PROTEGIDO
    public function perfil(Request $request)
    {
        return $request->user();
    }

    // LOGOUT
    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return [
            'message' => 'Sesión cerrada'
        ];
    }

    public function register(Request $request)
{
    $request->validate([
        'name'     => 'required|string|max:255',
        'email'    => 'required|email|unique:users,email',
        'password' => 'required|min:6',
    ]);

    $user = User::create([
        'name'     => $request->name,
        'email'    => $request->email,
        'password' => bcrypt($request->password),
    ]);

    // Crear token
    $token = $user->createToken('api-token')->plainTextToken;

    return response()->json([
        'message' => 'Usuario registrado exitosamente',
        'token' => $token,
        'user'  => $user
    ], 201);
}

}

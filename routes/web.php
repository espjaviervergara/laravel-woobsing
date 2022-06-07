<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Models\Usuario;
use App\Models\Rol;

use App\Http\Controllers\UsuarioController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('inicio');

Route::get('signup', function () {
    return view('registrar');
})->name('registrar');

Route::get('/dash/{email}/{password}',[UsuarioController::class, 'index'])->name('dash')->middleware('EmailVerificado');

Route::get('/verificación', function () {
    return view('verificacion');
})->name('verificacion');

Route::get('/sesiones', function () {
    return view('sesiones');
})->name('sesiones');
//

Route::post('usuario-autenticacion-doble', [UsuarioController::class, 'doble'])->name('auth.two');
Route::post('verificar-autenticacion-doble', [UsuarioController::class, 'verificar'])->name('verificar.two');
Route::post('verificar-correo', [UsuarioController::class, 'verificar_correo'])->name('verificar.correo');
Route::post('registrar-usuario', [UsuarioController::class, 'registrar_usuario'])->name('registrar_usuario');

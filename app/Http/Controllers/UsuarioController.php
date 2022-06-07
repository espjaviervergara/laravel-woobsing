<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use App\Http\Requests\StoreUsuarioRequest;
use App\Http\Requests\UpdateUsuarioRequest;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UsuarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($email, $password,Request $request)
    {


            // dd($request->ip());
            $usuario = Usuario::where('correo',$email)->first();

            if ($usuario->rol_id === 1 && $request->ip() === "127.0.0.1") {
                // session(['origin_sesion' => 'Usuario con rol 1 y IP Local Host']);
                $nueva_cookie = cookie('origin_sesion', 'Usuario con rol 1 y IP Local Host',30);


            }else {
                $nueva_cookie = cookie('origin_sesion', 'Bienvenido '.$usuario->nombre,30);
            }

            return response()->view('dash')->withCookie($nueva_cookie);




    }

    public function doble(Request $request)
    {
        //verificar
        $datos = $request;
        // dd($datos);
        $numero = rand(0, 9).rand(0, 9).rand(0, 9).rand(0, 9).rand(0, 9).rand(0, 9);

        $nueva_cookie = cookie('doble_factor', $numero,30);
        // dd($numero);
        $qr = QrCode::format('svg')->size(100)->color(0,0,0)->generate( $numero );
        return response()->view('two', compact('datos','qr'))->withCookie($nueva_cookie);
    }

    public function verificar(Request $request)
    {
        //
        $datos = $request;
        $value = $request->cookie('doble_factor');

        if ($value === $datos->codigo) {

            return redirect()->route('dash',['email' => $datos->email, 'password'=> $datos->password]);
        }else{
            return redirect()->route('inicio')->with('error', 'Codigo de doble factor incorrecto intente nuevamente');
        }


    }


    public function verificar_correo(Request $request)
    {
        //
        $datos = $request;

        $emailverificado = DB::table('usuarios')->where('correo',$request->correo_verificar)->exists();

        if ( $emailverificado) {

            $usuario = DB::table('usuarios')->where('correo',$request->correo_verificar)->first();

            DB::table('usuarios')
                ->where('id' ,$usuario->id)
                ->update([
                    'email_verified_at' => date('Y-m-d H:i:s'),
                ]);

            return redirect()->route('inicio')->with('correo', 'Correo Verificado Ingrese nuevamente');
        }else{
            return redirect()->route('inicio')->with('correo', 'Correo erroneo intente nuevamente');
        }


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function registrar_usuario(Request $request)
    {
        request()->validate([
            'correo'  =>   'required',
            'password' => 'required'
        ]);


        $user = new Usuario ($request->all());
        $user->password = bcrypt($request->password);
        $user->save();

        return redirect()->route('inicio')->with('usuario', 'usuario creado');;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreUsuarioRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUsuarioRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function show(Usuario $usuario)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function edit(Usuario $usuario)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateUsuarioRequest  $request
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUsuarioRequest $request, Usuario $usuario)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Usuario $usuario)
    {
        //
    }
}

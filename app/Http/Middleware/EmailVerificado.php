<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class EmailVerificado
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {



        $emailverificado = DB::table('usuarios')->where('correo',$request->email)->first();
        // dd($request->email);
        // dd($emailverificado->email_verified_at);

        // consulta a la Base de Datos si existe el usuario
        $existe = DB::table('usuarios')->where('correo',$request->email)->exists();

        if ( !$existe) {
            // si no existe el usuario lo redirecciona a la pagina para que se registre
            return redirect()->route('registrar');
        }else {

            // si existe el usuario verifica el email con una peticion del programa para dejarlo entral al dashboad

            if ($emailverificado->email_verified_at === null) {

                // si el campo email_verified es null quiere desir que nunca ha hecho el proceso de verificacion y lo redirecciona para que lo haga
                return redirect()->route('verificacion');
            }else {

                // si ya ha verificado el email compara la contraseña
              $pass= Hash::check($request->password, $emailverificado->password);
              if ($pass) {
                //   si la contraseña es correcta verifica la ultima sesion

                if ($emailverificado->ultima_sesion != null) {

                    $diferencia = date_diff(date_create($emailverificado->ultima_sesion),date_create(date('Y-m-d H:i:s')));

                    // si la ultima sesion es mayor a 24 horas o mas de un dia lo lleva a una pagina de sesion
                    if ($diferencia->format('%H')>24 || $diferencia->format('%d') != 0) {

                        DB::table('usuarios')
                        ->where('id' ,$emailverificado->id)
                        ->update([
                            'ultima_sesion' => date('Y-m-d H:i:s'),
                        ]);

                        return redirect()->route('sesiones');
                    }
                }

                // en todo caso si el usuario entra con email y password correcto actualiza el campo ultima session

                DB::table('usuarios')
                    ->where('id' ,$emailverificado->id)
                    ->update([
                        'ultima_sesion' => date('Y-m-d H:i:s'),
                    ]);

                return $next($request);
            }
        }




        return $next($request);
    }
}
}

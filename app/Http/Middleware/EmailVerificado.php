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

        $existe = DB::table('usuarios')->where('correo',$request->email)->exists();

        if ( !$existe) {
            return redirect()->route('registrar');
        }else {

            if ($emailverificado->email_verified_at === null) {
                return redirect()->route('verificacion');
            }else {
              $pass= Hash::check($request->password, $emailverificado->password);
              if ($pass) {
                //   dd(date_create(date('Y-m-d H:i:s')));

                if ($emailverificado->ultima_sesion != null) {

                    $diferencia = date_diff(date_create($emailverificado->ultima_sesion),date_create(date('Y-m-d H:i:s')));

                    // dd($diferencia->format('%d') != 0);
                    if ($diferencia->format('%H')>24 || $diferencia->format('%d') != 0) {

                        DB::table('usuarios')
                        ->where('id' ,$emailverificado->id)
                        ->update([
                            'ultima_sesion' => date('Y-m-d H:i:s'),
                        ]);

                        return redirect()->route('sesiones');
                    }
                }

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

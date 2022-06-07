<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Usuario;
use App\Models\Rol;
use App\Models\Permiso;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->truncateTables([

            'usuarios',
            'roles',
            'permisos',
        ]);
        // \App\Models\User::factory(10)->create();
        DB::statement('SET FOREIGN_KEY_CHECKS = 0;');




        // \App\Models\User::factory(10)->create();
        $permisos = [
             // Roles
            'ver-rol',
            'crear-rol',
            'editar-rol',
            'borrar-rol',
            // Grados
            'ver-grado',
            'crear-grado',
            'editar-grado',
            'borrar-grado'

        ];

        foreach ($permisos as $permiso) {
            Permiso::create(['permiso'=>$permiso]);
        }

        DB::table('roles')
            ->insert([
                ['nombre'=>'Administrador'],
                ['nombre'=>'Rector'],
                ['nombre'=>'Coordinador'],
                ['nombre'=>'Docente'],
                ['nombre'=>'Estudiante'],
                ['nombre'=>'secretario'],
            ]);

        Usuario::create([
            'nombre' => 'Super',
            'apellido' => 'Admin',
            'telefono' => '123456',
            'correo' => 'admin@email.com',
            'password' => bcrypt('123456789'),
            'rol_id' => 1
        ]);

        Usuario::create([
            'nombre' => 'javier',
            'apellido' => 'vergara',
            'telefono' => '123456',
            'correo' => 'javier@email.com',
            'password' => bcrypt('123456789'),
            'rol_id' => 2
        ]);

        Usuario::create([
            'nombre' => 'yeimis',
            'apellido' => 'cervantes',
            'telefono' => '123456',
            'correo' => 'yeimis@email.com',
            'password' => bcrypt('123456789'),
            'rol_id' => 2
        ]);

        Usuario::create([
            'nombre' => 'Gabriela',
            'apellido' => 'vergara',
            'telefono' => '123456',
            'correo' => 'gabriela@email.com',
            'password' => bcrypt('123456789'),
            'rol_id' => 3
        ]);

        Usuario::create([
            'nombre' => 'Mathia',
            'apellido' => 'vergara',
            'telefono' => '123456',
            'correo' => 'mathia@email.com',
            'password' => bcrypt('123456789'),
            'rol_id' => 4
        ]);

        DB::table('roles_permisos')
        ->insert([

            ['rol_id'=>1, 'permiso_id'=>1],
            ['rol_id'=>1, 'permiso_id'=>2],
            ['rol_id'=>1, 'permiso_id'=>3],
            ['rol_id'=>1, 'permiso_id'=>4],
            ['rol_id'=>1, 'permiso_id'=>5],

            ['rol_id'=>2, 'permiso_id'=>1],
            ['rol_id'=>2, 'permiso_id'=>2],
            ['rol_id'=>2, 'permiso_id'=>3],


            ['rol_id'=>3, 'permiso_id'=>1],
            ['rol_id'=>3, 'permiso_id'=>2],

            ['rol_id'=>4, 'permiso_id'=>1],

        ]);


        DB::statement('SET FOREIGN_KEY_CHECKS = 1;');
    }

    public function truncateTables(array $tables)
    {
        DB::statement('SET FOREIGN_KEY_CHECKS = 0;');
        foreach ($tables as $table) {
            DB::table($table)->truncate();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS = 1;');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRolesPermisosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('roles_permisos', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('rol_id');
            $table->foreign('rol_id')
                            ->references('id')->on('roles')
                            ->onDelete('cascade');

            $table->unsignedBigInteger('permiso_id');
            $table->foreign('permiso_id')
                            ->references('id')->on('permisos')
                            ->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('roles_permisos');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Rol;

class Permiso extends Model
{
    use HasFactory;

    protected $table = 'permisos';


    public function roles() {
        return $this->belongsToMany(Rol::class, 'roles_permisos','permiso_id','rol_id');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Usuario;
use App\Models\Permiso;

class Rol extends Model
{
    use HasFactory;
    protected $table = 'roles';

    protected $fillable = [
        'nombre',
    ];

    public function usuarios() {
        return $this->hasMany(Usuario::class);
    }

    public function permisos() {
        return $this->belongsToMany(Permiso::class,'roles_permisos','rol_id','permiso_id');
    }


}

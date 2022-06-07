<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Rol;

class Usuario extends Model
{
    use HasFactory;
    protected $table = 'usuarios';

    protected $fillable = [
        'nombre',
        'apellido',
        'correo',
        'telefono',

    ];

    protected $hidden = [
        'password',

    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // -	Un usuario puede tener un solo rol.
    public function rol()
    {
        return $this->belongsTo(Rol::class, 'rol_id');
    }

}

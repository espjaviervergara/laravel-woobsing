verificacion en progreso...

<form action="{{ route('verificar.correo') }}" method="POST">
    @csrf


    <div class="form-group mb-3">
        <label for="emailaddress">Digite su correo</label>
        <input class="form-control" type="email" id="codigo" required="" placeholder="Digite el codigo"
            name="correo_verificar">
    </div>


    <div class="form-group mb-0 text-center">
        <button class="btn btn-primary btn-block" type="submit"> Verificar </button>
    </div>

</form>

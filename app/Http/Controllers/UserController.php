<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class UserController extends Controller
{
    public function config()
    {
        return view('user.config');
    }

    public function update(Request $request)
    {
        //Conseguir usuario identificado
        $user = Auth::user();
        $id = $user->id;

        //Validacion del formulario
        $validate = $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'nick' => ['required', 'string', 'max:255', Rule::unique('users', 'nick')->ignore($id, 'id')],
            'email' => ['required', 'string', 'email', 'max:255', Rule::unique('users', 'email')->ignore($id, 'id')],
        ]);

        //Recoger los datos del usuario
        $name = $request->input('name');
        $surname = $request->input('surname');
        $nick = $request->input('nick');
        $email = $request->input('email');

        //Asignar nuevos valores al objeto del usuario
        $user->name = $name;
        $user->surname = $surname;
        $user->nick = $nick;
        $user->email = $email;

        //Subir la imagen
        $image_path = $request->file('image_path');
        if ($image_path) {
            //Poner nombre unico
            $image_path_name = time() . $image_path->getClientOriginalName();

            //Guardar en la carpeta storage(storage/app/users)
            Storage::disk('users')->put($image_path_name, File::get($image_path));

            //Seteo el nombre de la imagen en el objeto
            $user->image = $image_path_name;
        }

        //Ejecutar consultas y cambios en la base de datos
        $user->save();

        return redirect()->route('config')
            ->with(['message' => 'Usuario actualizado']);
    }
}

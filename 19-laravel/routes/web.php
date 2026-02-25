<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
route::get('HelloWorld', function () {
    return '<h1>Hello World! 🌎</h1>';
});

route::get('sayhello/{name}', function () {
    return '<h1>🤗Hello ' . request()->name . '</h1>';
});

Route::get('getall/pets', function () {
    $pers = App\Models\Pet::take(10)->get();
    dd($pers->toArray());
});

Route::get('show/pet/{id}', function () {
    $pets = App\Models\Pet::find(request()->id);
    dd($pets->toArray());
});

// Reto
// Debe de llamar a 20 usuarios, mostrar el nombre completo, cuantos años tiene y hace cuanto se unió, por ultimo ponerle estilos a la tabla.
//que el usuario que no tenga imagen le aparezla la imagen no-imagen.png
Route::get('view/allpets', function () {
    $pets = App\Models\Pet::all();
    return view('listpets')->with('pets', $pets);
});

Route::get('challenge', function () {
    echo "<h1 style='text-align:center; color:purple; font-size:17px; font-family:arial; padding:30px'>Challenge🧩</h1>
    <table border='3' style='margin:auto; width: 50%; border-radius:10px; border-color:purple;'>
        <tr>
        <th style='color:purple; font-size:17px; font-family:arial; '>Photo</th>
            <th style='color:purple; font-size:17px; font-family:arial; '>Full name</th>
            <th style='color:purple; font-size:17px; font-family:arial;'>Age</th>
            <th style='color:purple; font-size:17px; font-family:arial;'>Create at</th>
        </tr>";
    $users = App\Models\User::take(20)->get();
    foreach ($users as $user) {
        $age = \Carbon\Carbon::parse($user->birthdate)->age;
        $joined = \Carbon\Carbon::parse($user->created_at)->diffForHumans();
        echo "<tr>
                <td style='font-family:arial; background-color:#cc70c9;'><img src='" . asset('images/' . $user->photo) . "' width='70px' height='70px' style='border-radius:10%; margin:10px; margin-right:-20px;'></td>
                <td style='font-family:arial; background-color:#cc70c9;padding:5px'>{$user->fullname}</td>
                <td style='font-family:arial;background-color:#cc70c9;padding:5px'>{$age}</td>
                <td style='font-family:arial; background-color:#cc70c9;padding:5px'>{$joined}</td>
              </tr  >";
    }
});

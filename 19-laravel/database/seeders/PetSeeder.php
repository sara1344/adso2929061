<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Pet;

class PetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $pet = new Pet;
        $pet->name = 'Tobita';
        $pet->kind = 'Cat';
        $pet->weight = 6.2;
        $pet->age = 3;
        $pet->breed = 'Criolla';
        $pet->location = 'Manizales';
        $pet->description = 'Es muy linda, pero no le gusta que la carguen';
        $pet->save();

        $pet = new Pet;
        $pet->name = 'lola';
        $pet->kind = 'Dog';
        $pet->weight = 7.2;
        $pet->age = 5;
        $pet->breed = 'Criolla';
        $pet->location = 'Manizales';
        $pet->description = 'Tiene una pata malita';
        $pet->save();

        $pet = new Pet;
        $pet->name = 'Nala';
        $pet->kind = 'Cat';
        $pet->weight = 6.2;
        $pet->age = 3;
        $pet->breed = 'Criolla';
        $pet->location = 'Manizales';
        $pet->description = 'Es muy linda y cariñosa';
        $pet->save();
    }
}

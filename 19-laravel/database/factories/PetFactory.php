<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Pet>
 */
class PetFactory extends Factory
{
    use HasFactory;    

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->name,
            'kind' => fake()->randomElement(['Dog', 'Cat', 'Ping', 'Mouse']),
            'weight' => fake()->numerify('#.#'),
            'age' => fake()->numberBetween(1, 15),
            'breed' => fake()->randomElement(['type 1', 'type 2', 'type 3']),
            'location' => fake()->city,
            'description' => fake()->sentence(5),
            
        ];
    }
}

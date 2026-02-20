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
        $petNames = ['Buddy', 'Max', 'Charlie', 'Bella', 'Lucy', 'Daisy', 'Molly', 'Lola', 'Rocky', 'Sadie'];
        $dogBreeds = ['Labrador Retriever', 'German Shepherd', 'Golden Retriever', 'Bulldog', 'Beagle'];
        $catBreeds = ['Siamese', 'Persian', 'Maine Coon', 'Ragdoll', 'Sphynx'];
        $pigBreeds = ['Yorkshire', 'Hampshire', 'Duroc', 'Landrace', 'Pietrain'];
        $birdBreeds = ['Parrot', 'Canary', 'Finch', 'Sparrow', 'Cardinal'];

        $kind = fake()->randomElement(array('Dog', 'Cat', 'Pig', 'Bird'));

        switch ($kind) {
            case 'Dog':
                $breed = fake()->randomElement($dogBreeds);
                break;
            case 'Cat':
                $breed = fake()->randomElement($catBreeds);
                break;
            case 'Pig':
                $breed = fake()->randomElement($pigBreeds);
                break;
            default:
                $breed = fake()->randomElement($birdBreeds);
                break;
        }
        $name = fake()->randomElement($petNames);
        return [
            'name' => $name,
            'kind' => $kind,
            'weight' => fake()->numerify('#.#'),
            'age' => fake()->numberBetween(1, 15),
            'breed' => $breed,
            'location' => fake()->city,
            'description' => fake()->sentence(5),

        ];
    }
}

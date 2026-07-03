<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Pet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class PetController extends Controller
{
    public function index()
    {
        $pets = Pet::all();

        return response()->json([
            'message' => '✅ Query success',
            'Pets' => $pets,
        ]);
    }

    public function show($id)
    {
        $pet = Pet::find($id);

        if (!$pet) {
            return response()->json([
                'message' => '❌ Pet not found',
            ], 404);
        }

        return response()->json([
            'message' => '✅ Query success',
            'Pet' => $pet,
        ]);
    }

    public function store(Request $request)
    {
        try {
            $validation = $request->validate([
                'name' => ['required', 'string'],
                'photo' => ['required', 'image'],
                'kind' => ['required', 'string'],
                'weight' => ['required', 'numeric'],
                'age' => ['required', 'integer'],
                'breed' => ['required', 'string'],
                'location' => ['required', 'string'],
                'description' => ['required', 'string'],
                'active' => ['required', 'integer'],
                'status' => ['required', 'integer'],
            ]);

            if ($validation) {
                $photo = time().'.'.$request->photo->extension();
                $request->photo->move(public_path('images'), $photo);

                $pet = new Pet;
                $pet->name = $request->name;
                $pet->image = $photo;
                $pet->kind = $request->kind;
                $pet->weight = $request->weight;
                $pet->age = $request->age;
                $pet->breed = $request->breed;
                $pet->location = $request->location;
                $pet->description = $request->description;
                $pet->active = $request->active;
                $pet->status = $request->status;

                if ($pet->save()) {
                    return response()->json([
                        'message' => '✅ Pet created successfully',
                        'Pet' => $pet,
                    ], 201);
                }
            }
        } catch (ValidationException $e) {
            return response()->json([
                'message' => '❌ '.collect($e->errors())->flatten()->first(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'message' => '❌ Error creating pet',
            ], 400);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $pet = Pet::find($id);

            if (!$pet) {
                return response()->json([
                    'message' => '❌ Pet not found',
                ], 404);
            }

            $validation = $request->validate([
                'name' => ['sometimes', 'required', 'string'],
                'photo' => ['nullable', 'image'],
                'kind' => ['sometimes', 'required', 'string'],
                'weight' => ['sometimes', 'required', 'numeric'],
                'age' => ['sometimes', 'required', 'integer'],
                'breed' => ['sometimes', 'required', 'string'],
                'location' => ['sometimes', 'required', 'string'],
                'description' => ['sometimes', 'required', 'string'],
                'active' => ['sometimes', 'required', 'integer'],
                'status' => ['sometimes', 'required', 'integer'],
            ]);

            if ($validation) {
                if ($request->hasFile('photo')) {
                    $photo = time().'.'.$request->photo->extension();
                    $request->photo->move(public_path('images'), $photo);

                    if ($request->originphoto !== 'no-image.png' && file_exists(public_path('images/'.$pet->image))) {
                        unlink(public_path('images/'.$pet->image));
                    }
                } else {
                    $photo = $request->originphoto ?? $pet->image;
                }

                $pet->name = $request->name ?? $pet->name;
                $pet->image = $photo;
                $pet->kind = $request->kind ?? $pet->kind;
                $pet->weight = $request->weight ?? $pet->weight;
                $pet->age = $request->age ?? $pet->age;
                $pet->breed = $request->breed ?? $pet->breed;
                $pet->location = $request->location ?? $pet->location;
                $pet->description = $request->description ?? $pet->description;
                $pet->active = $request->active ?? $pet->active;
                $pet->status = $request->status ?? $pet->status;

                if ($pet->save()) {
                    return response()->json([
                        'message' => '✅ Pet updated successfully',
                        'Pet' => $pet,
                    ]);
                }
            }
        } catch (\Exception $e) {
            return response()->json([
                'message' => '❌ Error updating pet',
                'error' => $e->getMessage(),
            ], 400);
        }
    }

    public function deleteConfirm($id)
    {
        $pet = Pet::find($id);

        if (!$pet) {
            return response()->json([
                'message' => '❌ Pet not found',
            ], 404);
        }

        return response()->json([
            'message' => "¿Está segura de eliminar a {$pet->name}?",
            'confirm' => 'Sí, eliminar',
            'cancel' => 'Cancelar',
        ]);
    }

    public function destroy($id)
    {
        try {
            $pet = Pet::find($id);

            if (!$pet) {
                return response()->json([
                    'message' => '❌ Pet not found',
                ], 404);
            }

            DB::table('adoptions')->where('pet_id', $pet->id)->delete();

            if ($pet->image !== 'no-image.png' && file_exists(public_path('images/'.$pet->image))) {
                unlink(public_path('images/'.$pet->image));
            }

            $pet->delete();

            return response()->json([
                'message' => '✅ Pet deleted successfully',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => '❌ Error deleting pet',
            ], 400);
        }
    }
}

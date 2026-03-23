<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Puzzle;
use Illuminate\Http\Request;

class PuzzleController extends Controller
{
    public function index()
    {
        $puzzles = Puzzle::orderBy('id', 'desc')->get();
<<<<<<< HEAD

=======
>>>>>>> dev
        return response()->json($puzzles, 200);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
<<<<<<< HEAD
            'nom' => 'required|string|max:255',
            'categorie_id' => 'required|integer|exists:categories,id',
            'description' => 'required|string|max:255',
            'image' => 'required|string|max:255',
            'prix' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
=======
            'nom'          => 'required|string|max:255',
            'categorie_id' => 'required|integer|exists:categories,id',
            'description'  => 'required|string|max:500',
            'image'        => 'required|string|max:255',
            'prix'         => 'required|numeric|min:0',
            'stock'        => 'required|integer|min:0',
>>>>>>> dev
        ]);

        $puzzle = Puzzle::create($validated);

<<<<<<< HEAD
        return response()->json($puzzle, 201);
=======
        return response()->json([
            'message' => 'Puzzle créé avec succès',
            'data'    => $puzzle
        ], 201);
>>>>>>> dev
    }

    public function show(string $id)
    {
        $puzzle = Puzzle::find($id);

        if (!$puzzle) {
            return response()->json([
                'message' => 'Puzzle introuvable'
            ], 404);
        }

        return response()->json($puzzle, 200);
    }

    public function update(Request $request, string $id)
    {
        $puzzle = Puzzle::find($id);

        if (!$puzzle) {
            return response()->json([
                'message' => 'Puzzle introuvable'
            ], 404);
        }

        $validated = $request->validate([
<<<<<<< HEAD
            'nom' => 'required|string|max:255',
            'categorie_id' => 'required|integer|exists:categories,id',
            'description' => 'required|string|max:255',
            'image' => 'required|string|max:255',
            'prix' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
=======
            'nom'          => 'required|string|max:255',
            'categorie_id' => 'required|integer|exists:categories,id',
            'description'  => 'required|string|max:500',
            'image'        => 'required|string|max:255',
            'prix'         => 'required|numeric|min:0',
            'stock'        => 'required|integer|min:0',
>>>>>>> dev
        ]);

        $puzzle->update($validated);

<<<<<<< HEAD
        return response()->json($puzzle, 200);
=======
        return response()->json([
            'message' => 'Puzzle mis à jour',
            'data'    => $puzzle
        ], 200);
>>>>>>> dev
    }

    public function destroy(string $id)
    {
        $puzzle = Puzzle::find($id);

        if (!$puzzle) {
            return response()->json([
                'message' => 'Puzzle introuvable'
            ], 404);
        }

        $puzzle->delete();

        return response()->json([
            'message' => 'Puzzle supprimé avec succès'
        ], 200);
    }
}
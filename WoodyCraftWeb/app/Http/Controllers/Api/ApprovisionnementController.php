<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Approvisionnement;
use Illuminate\Http\Request;

class ApprovisionnementController extends Controller
{
    // GET : liste des approvisionnements
    public function index()
    {
        $approvisionnements = Approvisionnement::with('puzzle')->get();

        return response()->json($approvisionnements);
    }

    // GET : un approvisionnement
    public function show($id)
    {
        $approvisionnement = Approvisionnement::with('puzzle')->find($id);

        if (!$approvisionnement) {
            return response()->json([
                'message' => 'Approvisionnement introuvable'
            ], 404);
        }

        return response()->json($approvisionnement);
    }

    // POST : ajouter
    public function store(Request $request)
    {
        $request->validate([
            'nomFournisseur' => 'required|string',
            'puzzle_id' => 'required|exists:puzzles,id',
            'quantitee' => 'required|integer',
            'date' => 'required|date'
        ]);

        $approvisionnement = Approvisionnement::create([
            'nomFournisseur' => $request->nomFournisseur,
            'puzzle_id' => $request->puzzle_id,
            'quantitee' => $request->quantitee,
            'date' => $request->date
        ]);

        return response()->json([
            'message' => 'Approvisionnement ajouté',
            'data' => $approvisionnement
        ], 201);
    }

    // PUT : modifier
    public function update(Request $request, $id)
    {
        $approvisionnement = Approvisionnement::find($id);

        if (!$approvisionnement) {
            return response()->json([
                'message' => 'Approvisionnement introuvable'
            ], 404);
        }

        $request->validate([
            'nomFournisseur' => 'required|string',
            'puzzle_id' => 'required|exists:puzzles,id',
            'quantitee' => 'required|integer',
            'date' => 'required|date'
        ]);

        $approvisionnement->update([
            'nomFournisseur' => $request->nomFournisseur,
            'puzzle_id' => $request->puzzle_id,
            'quantitee' => $request->quantitee,
            'date' => $request->date
        ]);

        return response()->json([
            'message' => 'Approvisionnement modifié',
            'data' => $approvisionnement
        ]);
    }

    // DELETE : supprimer
    public function destroy($id)
    {
        $approvisionnement = Approvisionnement::find($id);

        if (!$approvisionnement) {
            return response()->json([
                'message' => 'Approvisionnement introuvable'
            ], 404);
        }

        $approvisionnement->delete();

        return response()->json([
            'message' => 'Approvisionnement supprimé'
        ]);
    }
}
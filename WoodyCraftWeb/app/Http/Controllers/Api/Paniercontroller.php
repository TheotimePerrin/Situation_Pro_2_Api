<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Panier;
use Illuminate\Http\JsonResponse;

class PanierController extends Controller
{
    /**
     * GET /api/paniers
     * Liste toutes les commandes validées (status = 1)
     * → Utilisé par Théotime pour la vue listing
     */
    public function index(): JsonResponse
    {
        $paniers = Panier::with('user')
            ->orderBy('created_at', 'desc')
            ->get()
            ->map(function ($panier) {
                return [
                    'id'            => $panier->id,
                    'client'        => $panier->user->nom ?? 'Inconnu',
                    'total'         => $panier->total,
                    'mode_paiement' => $panier->mode_paiement,
                    'statut'        => $panier->statut,
                    'date'          => $panier->created_at,
                ];
            });

        return response()->json($paniers);
    }

    /**
     * GET /api/paniers/{id}
     * Détail complet d'une commande
     * → TA TÂCHE : vue détail admin
     */
    public function show(int $id): JsonResponse
    {
        $panier = Panier::with([
            'user',
            'user.adresses', // adresse(s) de livraison du client
            'puzzles',        // articles de la commande via ligne_paniers
        ])->find($id);

        // Commande introuvable
        if (!$panier) {
            return response()->json([
                'message' => 'Commande introuvable'
            ], 404);
        }

        // Formatage des articles (puzzles de la commande)
        $articles = $panier->puzzles->map(function ($puzzle) {
            return [
                'id'          => $puzzle->id,
                'nom'         => $puzzle->nom,
                'image'       => $puzzle->image,
                'prix_unitaire' => $puzzle->prix,
                'quantite'    => $puzzle->pivot->quantite,
                'sous_total'  => round($puzzle->prix * $puzzle->pivot->quantite, 2),
            ];
        });

        // Formatage de l'adresse (première adresse du client)
        $adresse = null;
        if ($panier->user && $panier->user->adresses->isNotEmpty()) {
            $a = $panier->user->adresses->first();
            $adresse = [
                'rue'         => $a->rue,
                'ville'       => $a->ville,
                'code_postal' => $a->code_postal,
                'pays'        => $a->pays,
            ];
        }

        return response()->json([
            // ── Infos commande ──────────────────────────────
            'id'            => $panier->id,
            'statut'        => $panier->statut,
            'total'         => $panier->total,
            'mode_paiement' => $panier->mode_paiement,
            'date_commande' => $panier->created_at,

            // ── Infos client ────────────────────────────────
            'client' => $panier->user ? [
                'id'        => $panier->user->id,
                'nom'       => $panier->user->nom,
                'email'     => $panier->user->email,
                'telephone' => $panier->user->telephone,
            ] : null,

            // ── Adresse de livraison ────────────────────────
            'adresse_livraison' => $adresse,

            // ── Articles commandés ──────────────────────────
            'articles'    => $articles,
            'nb_articles' => $articles->count(),
        ]);
    }
}
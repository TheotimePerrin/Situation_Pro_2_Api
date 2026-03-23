<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Puzzle extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'categorie_id',
        'description',
        'image',
        'prix',
        'stock',
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'categorie_id');
    }
<<<<<<< HEAD
=======

    // Relation avec Panier via la table pivot "appartient"
    public function paniers()
    {
        return $this->belongsToMany(Panier::class, 'appartient')
                    ->withPivot('quantite');
    }
>>>>>>> dev
}
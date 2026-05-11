<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Approvisionnement extends Model
{
    public $timestamps = false; // 👈 ligne manquante !

    protected $fillable = [
        'nomFournisseur',
        'puzzle_id',
        'quantitee',
        'date'
    ];

    public function puzzle()
    {
        return $this->belongsTo(Puzzle::class, 'puzzle_id');
    }
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $table = 'schedule';
    protected $primaryKey = 'id';
    public $timestamp = true;
    use HasFactory;

    public function Staff()
    {
        return $this->belongsTo(Staff::class);
    }
}

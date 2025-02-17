<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    protected $table = 'staff';
    protected $primaryKey = 'id';
    public $timestamp = true;
    use HasFactory;
    public function Schedule()
    {
        return $this->hasMany(Schedule::class);
    }
}

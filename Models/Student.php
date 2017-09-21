<?php

namespace App\Model;

class Student extends BaseModel
{
    public function card()
    {
        return $this->hasOne('App\Model\StudentCard');
    }
}

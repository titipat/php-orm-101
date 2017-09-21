<?php

namespace App\Model;

class Course extends BaseModel
{
    public function sections()
    {
        return $this->hasMany('App\Model\Section', 'courses_id');
    }
}

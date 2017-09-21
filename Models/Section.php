<?php

namespace App\Model;

class Section extends BaseModel
{
    public function instructors()
    {
        return $this->belongsToMany('App\Model\Lecturer', 'section_instructors', 'sections_id', 'lecturers_id');
    }
}

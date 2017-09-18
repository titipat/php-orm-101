<?php

namespace App\Model;

class StudentCard extends BaseModel {
  public function student()
  {
    return $this->belongsTo('App\Model\Student', 'student_id');
  }
}
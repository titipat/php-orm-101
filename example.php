<?php

require_once __DIR__ . '/bootstrap.php';

use App\Model\Student as Student;

$students = Student::all();

foreach ($students as $student) {
  echo "{$student->first_name}<br>";
}
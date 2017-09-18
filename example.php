<?php

require_once __DIR__ . '/bootstrap.php';

use App\Model\Student as Student;

// select * from students
// $students = Student::all();

// foreach ($students as $student) {
//   // echo "{$student->first_name}\n";
//   echo "{$student->card->card_no}\n";
// }

// use App\Model\StudentCard as StudentCard;
// SELECT * FROM student_cards JOIN student ON student_cards.student_id = student.id WHERE id IN (1, 2)
// $cards = App\Model\StudentCard::find([1, 2]);
// foreach ($cards as $card) {
//   echo "Card no: {$card->card_no} is belongs to {$card->student->first_name}\n";
//   // print_r($card->student);
// }
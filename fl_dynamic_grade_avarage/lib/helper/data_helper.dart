import 'package:flutter/material.dart';
import '/model/lesson.dart';

class DataHelper {
  static List<Lesson> lessons = [];

  static addLesson(Lesson lesson) {
    lessons.add(lesson);
  }

  static double calculateAverage() {
    double total = 0;
    double totalCredit = 0;
    lessons.forEach((element) {
      total += element.credit * element.letterGrade;
      totalCredit += element.credit;
    });
    return total / totalCredit;
  }

  static int getLessonCount() {
    return lessons.length;
  }

  static Lesson getLesson(int index) {
    return lessons[index];
  }

  static List<String> getLetterGrades() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double getLetterGradeValue(String letterGrade) {
    switch (letterGrade) {
      case 'AA':
        return 4.0;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3.0;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2.0;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1.0;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0.0;
    }
  }

  static List<double> getCredits() {
    return [1, 2, 3, 4, 5];
  }

  static List<DropdownMenuItem<double>> getLetterGradeItems() {
    return getLetterGrades()
        .map((e) =>
            DropdownMenuItem(child: Text(e), value: getLetterGradeValue(e)))
        .toList();
  }

  static List<DropdownMenuItem<double>> getCreditItems() {
    return getCredits()
        .map((e) => DropdownMenuItem(child: Text(e.toString()), value: e))
        .toList();
  }
}

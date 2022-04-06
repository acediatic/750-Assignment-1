import "package:flutter/material.dart";

/*
 * An exercise represents an exercise within a workout, such as push ups or pull 
 * ups. Along with basic information about the exercise such as its name and 
 * description, it has a target number of repetitions (the number of repetitions
 * the user aims to complete), and a completed number of reptetions (the number 
 * of repetitions the user has actually completed).
 * 
 * It extends ChangeNotifier, to allow it to update listeners when its state
 * changes.
 */
class Exercise extends ChangeNotifier {
  String title;
  IconData icon;
  String description;
  int targetReps;
  int completedReps = 0;

  bool get isCompleted => completedReps >= targetReps;

  Exercise({
    Key? key,
    this.title = "",
    this.icon = Icons.access_time,
    this.description = "",
    this.targetReps = 1,
  });

  void increment() {
    completedReps++;
    notifyListeners();
  }

  void decrement() {
    completedReps--;
    notifyListeners();
  }

  void reset() {
    completedReps = 0;
    notifyListeners();
  }
}

import "package:flutter/material.dart";

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

import "package:flutter/material.dart";

class Exercise {
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
}

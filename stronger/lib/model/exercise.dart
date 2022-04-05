import "package:flutter/material.dart";

class Exercise {
  final String title;
  final IconData icon;
  final String description;
  final int targetReps;
  int completedReps = 0;

  bool get isCompleted => completedReps >= targetReps;

  Exercise({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
    required this.targetReps,
  });
}

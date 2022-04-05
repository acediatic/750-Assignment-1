import "package:flutter/material.dart";

class Exercise {
  final String title;
  final IconData icon;
  final String description;
  final int numberReps;

  const Exercise({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
    required this.numberReps,
  });
}

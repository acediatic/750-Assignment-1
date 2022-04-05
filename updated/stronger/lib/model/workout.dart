import "package:flutter/material.dart";
import "exercise.dart";

class Workout {
  final String title;
  final IconData icon;
  final String description;
  final List<Exercise> exercises;

  const Workout({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
    required this.exercises,
  });
}

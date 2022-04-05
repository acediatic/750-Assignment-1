import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "exercise.dart";

class Workout extends ChangeNotifier {
  final String title;
  IconData icon;
  String description;
  List<Exercise> exercises;

  Workout({
    Key? key,
    required this.title,
    this.icon = FontAwesomeIcons.dumbbell,
    this.description = "",
    this.exercises = const [],
  });

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
    notifyListeners();
  }

  void removeExercise(Exercise exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }

  void updateExercise(Exercise exercise) {
    notifyListeners();
  }
}

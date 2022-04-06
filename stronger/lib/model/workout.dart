import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "exercise.dart";

class Workout extends ChangeNotifier {
  String title;
  IconData icon;
  String description;
  List<Exercise> exercises = [];
  int targetRounds;

  Workout({
    Key? key,
    this.title = "New Workout",
    this.icon = FontAwesomeIcons.dumbbell,
    this.description = "",
    this.targetRounds = 1,
  });

  Workout.withExercises(
      {Key? key,
      this.title = "New Workout",
      this.icon = FontAwesomeIcons.dumbbell,
      this.description = "",
      this.targetRounds = 1,
      required this.exercises});

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

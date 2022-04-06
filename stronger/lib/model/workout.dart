import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "exercise.dart";

/*
 * A workout represents a user's workout. It is a collection of exercises in a 
 * specific order. Along with the basic information such as title and 
 * description, a workout has an ordered list of repetitions and a target number 
 * of rounds to complete (how many times all exercises will be attempted).
 * 
 * It extends ChangeNotifier, to allow it to update listeners when its state
 * changes.
 */
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

  void removeExerciseAtIndex(int index) {
    exercises.removeAt(index);
    notifyListeners();
  }

  void swapExercise(int oldIndex, int newIndex) {
    // swaps the exercise at oldIndex with the exercise at newIndex
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }

    final Exercise temp = exercises[oldIndex];
    exercises[oldIndex] = exercises[newIndex];
    exercises[newIndex] = temp;
    notifyListeners();
  }
}

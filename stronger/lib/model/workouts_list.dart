import 'dart:collection';

import "package:flutter/material.dart";
import "workout.dart";

class WorkoutsList extends ChangeNotifier {
  WorkoutsList(this._workouts);

  // internal, private workout state
  final List<Workout> _workouts;

  // Unmodifiable view of current workouts
  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  void add(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void remove(Workout workout) {
    _workouts.remove(workout);
    notifyListeners();
  }

  void removeAll() {
    _workouts.clear();
    notifyListeners();
  }
}

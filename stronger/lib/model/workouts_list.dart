import 'dart:collection';

import "package:flutter/material.dart";
import "workout.dart";

/* 
 * A workout list represents the collection of the user's workouts. 
 * It stores all the workouts the user has.
 * 
 * It extends ChangeNotifier, to allow it to update listeners when its state
 * changes.
 */
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

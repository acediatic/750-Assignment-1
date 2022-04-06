import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './model/workout.dart';
import './model/exercise.dart';

/// Contains demo user workouts, for the purposes of this example.
List<Workout> demoWorkouts = [
  Workout.withExercises(
    title: "Chest",
    icon: FontAwesomeIcons.childReaching,
    description: "Chest workout",
    exercises: [
      Exercise(
        title: "Bench press",
        icon: Icons.access_time,
        description: "Bench press",
        targetReps: 10,
      ),
      Exercise(
        title: "Incline bench press",
        icon: Icons.access_time,
        description: "Incline bench press",
        targetReps: 10,
      ),
    ],
  ),
  Workout.withExercises(
    title: "Full Body",
    icon: FontAwesomeIcons.personRunning,
    description: "Upper Body workout",
    exercises: [
      Exercise(
        title: "Deadlift",
        icon: Icons.access_time,
        description: "Deadlift",
        targetReps: 10,
      ),
      Exercise(
        title: "Pull up",
        icon: Icons.access_time,
        description: "Pull up",
        targetReps: 10,
      ),
    ],
  ),
  Workout.withExercises(
    title: "Legs",
    icon: FontAwesomeIcons.socks,
    description: "Legs workout",
    exercises: [
      Exercise(
        title: "Squat",
        icon: Icons.access_time,
        description: "Squat",
        targetReps: 10,
      ),
      Exercise(
        title: "Leg press",
        icon: Icons.access_time,
        description: "Leg press",
        targetReps: 10,
      ),
    ],
  ),
];

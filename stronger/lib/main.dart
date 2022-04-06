import 'package:flutter/material.dart';
import 'package:stronger/example.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/pages/create_workout_page.dart';
import 'package:stronger/pages/exercise_page.dart';
import 'package:stronger/pages/freedom_mode_page.dart';
import 'package:stronger/pages/workout_page.dart';
import 'pages/add_exercise_page.dart';
import 'pages/home.dart';
import 'package:provider/provider.dart';
import "package:stronger/model/workout.dart";
import 'pages/list_workouts.dart';

/// The main function is the entry point for the application.
void main() {
  // The ChangeNotifierProvider is used to provide the WorkoutsList to all
  // widgets that need it.
  runApp(ChangeNotifierProvider(
      child: const StrongerApp(),
      create: (context) => WorkoutsList(demoWorkouts)));
}

/// The stronger app is the root widget of the application.
class StrongerApp extends StatelessWidget {
  const StrongerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stronger',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.amber,
        // dark mode
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      // The routes are the pages that the application will navigate to.
      routes: {
        "/": (context) => const Home(),
        ListWorkouts.routeName: (context) => const ListWorkouts(),
        WorkoutPage.routeName: (context) => const WorkoutPage(),
        ExercisePage.routeName: (context) => const ExercisePage(),
        CreateWorkoutPage.routeName: (context) => ChangeNotifierProvider(
              child: const CreateWorkoutPage(),
              create: (context) => Workout(),
            ),
        AddExercisesPage.routeName: (context) => const AddExercisesPage(),
        FreedomModePage.routeName: ((context) => const FreedomModePage()),
      },
    );
  }
}

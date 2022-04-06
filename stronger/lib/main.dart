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

void main() {
  runApp(ChangeNotifierProvider(
      child: const StrongerApp(),
      create: (context) => WorkoutsList(demoWorkouts)));
}

const freedomModeRoute = '/freedom_mode';
const createWorkoutRoute = '/create_workout';

class StrongerApp extends StatelessWidget {
  const StrongerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

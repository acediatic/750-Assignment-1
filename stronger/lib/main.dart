import 'package:flutter/material.dart';
import 'package:stronger/pages/create_workout_page.dart';
import 'package:stronger/pages/exercise_page.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/pages/workout_page.dart';
import 'pages/add_exercise_page.dart';
import 'pages/home.dart';
import 'package:provider/provider.dart';
import "package:stronger/model/workout.dart";
import "package:stronger/model/exercise.dart";
import 'pages/list_workouts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => WorkoutsList(
      [
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
          title: "Back",
          icon: FontAwesomeIcons.arrowLeft,
          description: "Back workout",
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
      ],
    ),
  ));
}

const freedomModeRoute = '/freedom_mode';
const createWorkoutRoute = '/create_workout';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      },
    );
  }
}

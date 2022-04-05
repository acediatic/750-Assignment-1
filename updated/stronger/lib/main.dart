import 'package:flutter/material.dart';
import 'package:stronger/exercise_page.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/workout_page.dart';
import "home.dart";
import 'package:provider/provider.dart';
import "package:stronger/model/workout.dart";
import "package:stronger/model/exercise.dart";
import 'list_workouts.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => WorkoutsList(
      const [
        Workout(
          title: "Chest",
          icon: Icons.access_time,
          description: "Chest workout",
          exercises: [
            Exercise(
              title: "Bench press",
              icon: Icons.access_time,
              description: "Bench press",
              numberReps: 10,
            ),
            Exercise(
              title: "Incline bench press",
              icon: Icons.access_time,
              description: "Incline bench press",
              numberReps: 10,
            ),
          ],
        ),
        Workout(
          title: "Back",
          icon: Icons.access_time,
          description: "Back workout",
          exercises: [
            Exercise(
              title: "Deadlift",
              icon: Icons.access_time,
              description: "Deadlift",
              numberReps: 10,
            ),
            Exercise(
              title: "Pull up",
              icon: Icons.access_time,
              description: "Pull up",
              numberReps: 10,
            ),
          ],
        ),
        Workout(
          title: "Legs",
          icon: Icons.access_time,
          description: "Legs workout",
          exercises: [
            Exercise(
              title: "Squat",
              icon: Icons.access_time,
              description: "Squat",
              numberReps: 10,
            ),
            Exercise(
              title: "Leg press",
              icon: Icons.access_time,
              description: "Leg press",
              numberReps: 10,
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
        primarySwatch: Colors.blue,
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
      },
    );
  }
}

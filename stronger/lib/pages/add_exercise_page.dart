import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/components/add_exercise_modal.dart';
import 'package:stronger/components/view_workout_exercises.dart';
import 'package:stronger/model/workout.dart';
import 'package:stronger/model/workouts_list.dart';

import '../components/standard_scaffold.dart';

/// The Add Exercise page allows the user to add exercises to their newly created
/// workout. They can do this by pushing the floating action button in the bottom
/// right corner. This produces a dialogue into which they can describe the
/// exercise's name and target number of repetitions.
///
/// Adding the exercise adds it to the list.
///
class AddExercisesPage extends StatelessWidget {
  const AddExercisesPage({Key? key}) : super(key: key);

  static const routeName = "/add_exercises";

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: Consumer<Workout>(
        builder: (context, workout, child) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(child: ViewWorkoutExercises()),
                const SizedBox(height: 16.0),
                // button to save new workout and proceed to workout screen
                ElevatedButton(
                  child: const Text("Save Workout"),
                  onPressed: () {
                    context.read<WorkoutsList>().add(workout);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/workout", ModalRoute.withName("/"),
                        arguments: workout);
                  },
                ),
              ],
            ),
            // floating action button to add exercise
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  final exercise = await AddExerciseModal.showModal(context);
                  if (exercise != null) workout.addExercise(exercise);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

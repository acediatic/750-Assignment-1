import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/components/add_exercise_modal.dart';
import 'package:stronger/model/workout.dart';
import 'package:stronger/pages/create_workout_page.dart';

import '../components/standard_scaffold.dart';

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
                const CreateWorkoutPage(),
                const SizedBox(height: 16.0),
                // button to save new workout and proceed to workout screen
                ElevatedButton(
                  child: const Text("Save Workout"),
                  onPressed: () {
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

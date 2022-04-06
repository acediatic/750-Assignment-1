import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/components/add_exercise_modal.dart';
import 'package:stronger/model/workout.dart';

import '../components/standard_scaffold.dart';

class AddExercisesPage extends StatelessWidget {
  const AddExercisesPage({Key? key}) : super(key: key);

  static const routeName = "/add_exercises";

  @override
  Widget build(BuildContext context) {
    return Consumer<Workout>(
        builder: (context, workout, child) => StandardScaffold(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Exercises", style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 16.0),
                Expanded(
                  child: workout.exercises.isNotEmpty
                      ? ListView.builder(
                          itemCount: workout.exercises.length,
                          itemBuilder: (context, index) {
                            final exercise = workout.exercises[index];
                            return ListTile(
                              leading: const Icon(Icons.access_time),
                              title: Text(exercise.title),
                              subtitle: Text(exercise.description),
                              trailing: Text(exercise.targetReps.toString()),
                            );
                          },
                        )
                      : const Center(
                          // italics text
                          child: Text(
                            "No exercises added yet",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                ),
                // floating action button to add exercise
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      final exercise =
                          await AddExerciseModal.showModal(context);

                      if (exercise != null) {
                        workout.addExercise(exercise);
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}

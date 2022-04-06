import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/components/add_exercise_modal.dart';
import 'package:stronger/model/workout.dart';

import '../components/standard_scaffold.dart';
import '../model/exercise.dart';

class AddExercisesPage extends StatefulWidget {
  const AddExercisesPage({Key? key}) : super(key: key);

  static const routeName = "/add_exercises";

  @override
  State<AddExercisesPage> createState() => _AddExercisesPageState();
}

class _AddExercisesPageState extends State<AddExercisesPage> {
  late List<Exercise> _exercises;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _exercises = Provider.of<Workout>(context, listen: true).exercises;
  }

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
                      ? ReorderableListView(
                          buildDefaultDragHandles: true,
                          children: <ListTile>[
                            for (int index = 0;
                                index < _exercises.length;
                                index++)
                              ListTile(
                                key: UniqueKey(),
                                tileColor: index % 2 == 0
                                    ? Theme.of(context).colorScheme.background
                                    : Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(0.5),
                                leading: Text("${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                title: Row(
                                  children: [
                                    Text("${_exercises[index].title} | "),
                                    Text(
                                      "${_exercises[index].targetReps} reps",
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    // italics text
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      workout.removeExerciseAtIndex(index),
                                ),
                              )
                          ],
                          onReorder: workout.swapExercise)
                      : const Center(
                          // italics text
                          child: Text(
                            "No exercises added yet",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                ),
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
                // floating action button to add exercise
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      final exercise =
                          await AddExerciseModal.showModal(context);

                      if (exercise != null) workout.addExercise(exercise);
                    },
                  ),
                ),
              ],
            )));
  }
}

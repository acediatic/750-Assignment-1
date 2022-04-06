import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/model/workout.dart';

import '../model/exercise.dart';

class ViewWorkoutExercises extends StatefulWidget {
  const ViewWorkoutExercises({Key? key}) : super(key: key);

  @override
  State<ViewWorkoutExercises> createState() => _ViewWorkoutExercisesState();
}

class _ViewWorkoutExercisesState extends State<ViewWorkoutExercises> {
  late List<Exercise> _exercises;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _exercises = context.watch<Workout>().exercises;
  }

  @override
  Widget build(BuildContext context) {
    Workout workout = context.read<Workout>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Exercises", style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 16.0),
        Expanded(
          child: workout.exercises.isNotEmpty
              ? ReorderableListView(
                  buildDefaultDragHandles: true,
                  children: <ListTile>[
                    for (int index = 0; index < _exercises.length; index++)
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
                                  color: Theme.of(context).colorScheme.primary,
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
                          onPressed: () => workout.removeExerciseAtIndex(index),
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
        // button to save new workout and proceed to workout screen
      ],
    );
  }
}

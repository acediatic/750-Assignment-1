import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:stronger/model/workout.dart';

import '../model/exercise.dart';

/*
 * The ViewWorkoutExercises widget is used to display a list of exercises
 * of a particular workout. 
 * 
 * It is used on the add exercises page. 
 * 
 * It allows reordering and deleting of exercises. To achieve this, it uses the
 * Flutter Reorderable List widget, and the Slidable widget from the Flutter_slidable
 * package.
 */
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
              ? SlidableAutoCloseBehavior(
                  child: ReorderableListView(
                      buildDefaultDragHandles: true,
                      children: <Slidable>[
                        for (int index = 0; index < _exercises.length; index++)
                          Slidable(
                            key: UniqueKey(),
                            groupTag: workout,
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              // A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(onDismissed: () {}),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (context) {
                                    workout.removeExerciseAtIndex(index);
                                  },
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: ListTile(
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
                              trailing: ReorderableDragStartListener(
                                index: index,
                                child: const Icon(Icons.drag_handle),
                              ),
                            ),
                          ),
                      ],
                      onReorder: workout.swapExercise),
                )
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

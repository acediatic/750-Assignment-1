import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:stronger/components/standard_scaffold.dart';

import '../components/rep_counter.dart';
import '../model/exercise.dart';

/// The exercise page displays an exercise. It has an adjustable counter,
/// allowing the user to keep track of the number of repetitions they've
/// completed.
class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  static const routeName = "/exercise";

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: Consumer<Exercise>(
        builder: ((context, _exercise, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_exercise.title,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(
                    child: RepCounter(
                      exercise: _exercise,
                    ),
                    height: 300),
                // row of icon buttons to add, remove, or finish the exercise
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.done)),
                )
              ],
            )),
      ),
    );
  }
}

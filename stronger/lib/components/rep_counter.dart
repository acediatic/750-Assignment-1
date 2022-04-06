import 'package:flutter/material.dart';

import '../model/exercise.dart';
import 'crement_button.dart';

class RepCounter extends StatelessWidget {
  const RepCounter({Key? key, required this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Reps".toUpperCase(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "${exercise.completedReps}/${exercise.targetReps}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  CrementButton(
                      icon: Icons.remove,
                      crement: () {
                        if (exercise.completedReps > 0) {
                          exercise.decrement();
                        }
                      }),
                  const SizedBox(width: 10.0),
                  CrementButton(icon: Icons.add, crement: exercise.increment),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

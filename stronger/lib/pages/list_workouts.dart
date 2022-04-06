import 'package:flutter/material.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/components/standard_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:stronger/pages/workout_page.dart';

/// The list workouts page lists all the user's saved workouts. They can click
/// any workout to be taken to it's page.
///
/// It includes a hero transition to animate between selecting a workout from
/// the list and its corresponding page.
class ListWorkouts extends StatelessWidget {
  const ListWorkouts({Key? key}) : super(key: key);

  static const routeName = "/list-workouts";

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: Consumer<WorkoutsList>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.workouts.length,
            itemBuilder: (context, index) {
              final workout = model.workouts[index];
              return ListTile(
                leading: Column(children: [
                  Hero(
                    child: Icon(workout.icon),
                    tag: workout,
                  ),
                ], mainAxisAlignment: MainAxisAlignment.center),
                title: Text(workout.title),
                subtitle: Text(workout.description),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, WorkoutPage.routeName,
                      arguments: workout);
                },
              );
            },
          );
        },
      ),
    );
  }
}

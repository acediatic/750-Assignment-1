import 'package:flutter/material.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/standard_scaffold.dart';
import "package:provider/provider.dart";
import 'package:stronger/workout_page.dart';

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
                leading: Icon(workout.icon),
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

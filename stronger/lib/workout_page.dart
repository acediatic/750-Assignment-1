import "package:flutter/material.dart";
import 'package:stronger/model/workout.dart';
import 'package:stronger/standard_scaffold.dart';
import "package:stronger/exercise_page.dart";

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  static const routeName = "/workout";

  @override
  Widget build(BuildContext context) {
    final workout = ModalRoute.of(context)!.settings.arguments as Workout;

    return StandardScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              workout.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            Text(
              "Exercises",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: workout.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = workout.exercises[index];
                  return ListTile(
                    leading: Icon(exercise.icon),
                    title: Text(exercise.title),
                    subtitle: Text(exercise.description),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, ExercisePage.routeName,
                          arguments: workout);
                    },
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

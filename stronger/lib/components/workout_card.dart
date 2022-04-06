import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/workout.dart';
import '../pages/workout_page.dart';

/*
 * The WorkoutCard widget is used to display a workout.
 * It is used on the homepage.
 * It contains a title, a subtitle, and a button to view the workout.
 */
class WorkoutCard extends StatelessWidget {
  const WorkoutCard({Key? key, required this.workout}) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        Navigator.pushNamed(context, WorkoutPage.routeName, arguments: workout);
      },
      child: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
                child: FaIcon(
                  workout.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                tag: workout),
            Text(workout.title),
          ],
        ),
      ),
    ));
  }
}

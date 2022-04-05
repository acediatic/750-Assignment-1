import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stronger/pages/list_workouts.dart';
import 'package:stronger/main.dart';
import 'package:stronger/model/workout.dart';
import 'package:stronger/model/workouts_list.dart';
import 'package:stronger/pages/workout_page.dart';
import '../components/standard_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: Center(
        // list of rounded cards with titles "My Workouts", "Freedom Mode", and "Create Workout".
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Workouts",
            ),
            SizedBox(
              height: 100,
              child: Consumer<WorkoutsList>(
                  builder: (context, workoutsList, child) {
                return ListView.builder(
                  // horizontal scrolling
                  scrollDirection: Axis.horizontal,
                  itemCount: workoutsList.workouts.length,
                  itemBuilder: (context, index) {
                    final workout = workoutsList.workouts[index];
                    return WorkoutCard(workout: workout);
                  },
                );
              }),
            ),
            const RoundedCard(
              text: 'My Workouts',
              leadingIcon: Icons.fitness_center,
              pushRoute: ListWorkouts.routeName,
            ),
            const RoundedCard(
              text: 'Freedom Mode',
              leadingIcon: Icons.accessibility_outlined,
              pushRoute: freedomModeRoute,
            ),
            const RoundedCard(
              text: 'Create Workout',
              leadingIcon: Icons.add_circle_outline_outlined,
              pushRoute: createWorkoutRoute,
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final String pushRoute;
  const RoundedCard(
      {Key? key,
      required this.text,
      required this.leadingIcon,
      required this.pushRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, pushRoute);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  leadingIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(text),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
            FaIcon(
              workout.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              workout.title,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 25,
                  ),
            ),
          ],
        ),
      ),
    ));
  }
}

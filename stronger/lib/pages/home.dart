import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stronger/pages/list_workouts.dart';
import 'package:stronger/main.dart';
import 'package:stronger/model/workouts_list.dart';
import '../components/rounded_title_card.dart';
import '../components/standard_scaffold.dart';
import '../components/workout_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: Center(
        // list of rounded cards with titles "My Workouts", "Freedom Mode", and "Create Workout".
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Workouts",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 30,
                      ),
                ),
                const SizedBox(height: 10),
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
              ],
            ),
            const RoundedTitleCard(
              text: 'My Workouts',
              leadingIcon: Icons.fitness_center,
              pushRoute: ListWorkouts.routeName,
            ),
            const RoundedTitleCard(
              text: 'Freedom Mode',
              leadingIcon: Icons.accessibility_outlined,
              pushRoute: freedomModeRoute,
            ),
            const RoundedTitleCard(
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

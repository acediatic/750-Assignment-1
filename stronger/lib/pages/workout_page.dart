import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stronger/model/workout.dart';
import 'package:stronger/components/standard_scaffold.dart';
import 'package:stronger/pages/exercise_page.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  static const routeName = "/workout";

  @override
  Widget build(BuildContext context) {
    final workout = ModalRoute.of(context)!.settings.arguments as Workout;

    return StandardScaffold(
        child: Center(
      // creates two columns at the top, with a full width list at the bottom

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
                  ],
                ),
              ),
              Hero(child: FaIcon(workout.icon, size: 50), tag: workout),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
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
                  leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text((index + 1).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                      ]),
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
        ],
      ),
    ));
  }
}

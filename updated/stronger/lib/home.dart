import 'package:flutter/material.dart';
import 'standard_scaffold.dart';

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
            Text(
              "My Workouts",
            ),
            // horiozontal scroller of cards
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  // Card with title "Legs" and muscle emoji
                  WorkoutCard(
                    title: "Tabata Sprints",
                    icon: Icons.directions_run,
                  ),

                  // Card with title "Chest" and muscle emoji
                  WorkoutCard(
                    title: "Chest",
                    icon: Icons.accessibility,
                  ),

                  // Card with title "Back" and muscle emoji
                  WorkoutCard(
                    title: "Back",
                    // back icon
                    icon: Icons.fitness_center,
                  ),
                ],
              ),
            ),
            RoundedCard(
              text: 'My Workouts',
              leadingIcon: Icons.fitness_center,
            ),
            RoundedCard(
              text: 'Freedom Mode',
              leadingIcon: Icons.accessibility_outlined,
            ),
            RoundedCard(
              text: 'Create Workout',
              leadingIcon: Icons.add_circle_outline_outlined,
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
  const RoundedCard({Key? key, required this.text, required this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          // TODO navigate to the corresponding page
          ;
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
  const WorkoutCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        // TODO navigate to the corresponding page
      },
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 25,
                  ),
            ),
            Icon(
              icon,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    ));
  }
}

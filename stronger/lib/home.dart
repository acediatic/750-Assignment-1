import 'package:flutter/material.dart';
import 'package:stronger/appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Displays a transparent app bar with a heart icon on the left hand
      // side and a profile icon on the right hand side.
      appBar: const StrongerAppBar(),
      body: Center(
        // list of rounded cards with titles "My Workouts", "Freedom Mode", and "Create Workout".
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
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
            width: 300,
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

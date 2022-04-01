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
            ),
            RoundedCard(
              text: 'Freedom Mode',
            ),
            RoundedCard(
              text: 'Create Workout',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final String text;
  const RoundedCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          ;
        },
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/standard_scaffold.dart';
import '../model/exercise.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  static const routeName = "/create_workout";

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  String title = '';
  String description = '';
  IconData icon = FontAwesomeIcons.dumbbell;
  List<Exercise> exercises = const [];
  int targetReps = 0;

  @override
  Widget build(BuildContext context) {
    return (StandardScaffold(
      child: Column(
        children: [
          Text(
            "Create Workout",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16.0),
          TextField(
            decoration: const InputDecoration(
              labelText: "Workout Name",
            ),
            onChanged: (value) => title = value,
          ),
          const SizedBox(height: 16.0),
          TextField(
            decoration: const InputDecoration(
              labelText: "Description",
            ),
            onChanged: (value) => description = value,
          ),
          const SizedBox(height: 16.0),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            decoration: const InputDecoration(
              labelText: "Target Reps",
            ),
            onChanged: (value) => targetReps = value as int,
          ),
          const SizedBox(height: 16.0),
          // button to navigate to the add exercises screen
          ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Spacer(flex: 5),
                Text("Add Exercises"),
                Spacer(flex: 1),
                Icon(Icons.arrow_forward),
                Spacer(flex: 5),
              ],
            ),
            onPressed: () {
              // TODO navigate to add exercises screen
            },
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stronger/components/standard_scaffold.dart';

import '../model/workout.dart';
import '../components/view_workout_exercises.dart';

class CreateWorkoutPage extends StatelessWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  static const routeName = "/create_workout";

  @override
  Widget build(BuildContext context) {
    return StandardScaffold(
      child: SingleChildScrollView(
        child: Consumer<Workout>(
          builder: (context, workout, child) => Column(
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
                onChanged: (value) => workout.title = value,
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
                onChanged: (value) => workout.description = value,
              ),
              const SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                decoration: const InputDecoration(
                  labelText: "Target Rounds",
                ),
                onChanged: (value) => workout.targetRounds =
                    !int.parse(value).isNaN ? int.parse(value) : 0,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: workout,
                        child: const ViewWorkoutExercises(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

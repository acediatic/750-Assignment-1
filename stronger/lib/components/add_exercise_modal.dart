import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stronger/model/exercise.dart';

class AddExerciseModal extends StatefulWidget {
  const AddExerciseModal({Key? key}) : super(key: key);

  static Future<Exercise?> showModal(context) {
    return showModalBottomSheet<Exercise>(
      context: context,
      builder: (BuildContext context) => const AddExerciseModal(),
      isScrollControlled: true,
    );
  }

  @override
  State<AddExerciseModal> createState() => _AddExerciseModalState();
}

class _AddExerciseModalState extends State<AddExerciseModal> {
  final exercise = Exercise();

  @override
  Widget build(BuildContext context) {
    const double padding = 16;
    return Padding(
      padding: EdgeInsets.only(
          left: padding,
          top: padding,
          right: padding,
          bottom: padding + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Add an Exercise', style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: padding),
          TextField(
            decoration: const InputDecoration(
              labelText: "Exercise Name",
            ),
            onChanged: (value) => exercise.title = value,
          ),
          const SizedBox(height: padding),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            decoration: const InputDecoration(
              labelText: "Target Reps",
            ),
            onChanged: (value) => exercise.targetReps = int.parse(value),
          ),
          const SizedBox(height: padding),
          ElevatedButton(
            child: const Text('Add Exercise'),
            onPressed: () => Navigator.pop(context, exercise),
          )
        ],
      ),
    );
  }
}

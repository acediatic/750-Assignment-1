import "package:flutter/material.dart";
import 'package:stronger/components/standard_scaffold.dart';

import '../model/exercise.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  static const routeName = "/exercise";

  @override
  Widget build(BuildContext context) {
    final _exercise = ModalRoute.of(context)?.settings.arguments as Exercise;

    return StandardScaffold(
        child: Center(
            child: Text("Exercise Page for \"${_exercise.title}\"",
                style: const TextStyle(fontSize: 24.0))));
  }
}

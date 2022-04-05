import "package:flutter/material.dart";
import 'package:stronger/components/standard_scaffold.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key}) : super(key: key);

  static const routeName = "/exercise";

  @override
  Widget build(BuildContext context) {
    return const StandardScaffold(child: Center(child: Text("Exercise Page")));
  }
}

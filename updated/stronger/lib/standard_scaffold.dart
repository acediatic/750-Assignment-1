import 'package:flutter/material.dart';
import 'package:stronger/appbar.dart';

class StandardScaffold extends StatelessWidget {
  final Widget child;

  const StandardScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Displays a transparent app bar with a heart icon on the left hand
      // side and a profile icon on the right hand side.
      appBar: const StrongerAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

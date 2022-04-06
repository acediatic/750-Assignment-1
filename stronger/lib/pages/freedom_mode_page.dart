import 'package:flutter/material.dart';
import 'package:stronger/components/standard_scaffold.dart';

class FreedomModePage extends StatelessWidget {
  const FreedomModePage({Key? key}) : super(key: key);

  static const routeName = "/freedom_mode";

  @override
  Widget build(BuildContext context) {
    // return a basic message stating that the freedom mode hasn't yet been implemented.
    return StandardScaffold(
      child: Stack(
        children: [
          const Center(
            child: Text("Freedom mode hasn't been implemented yet."),
          ),
          // complete floating action to return to homescreen
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}

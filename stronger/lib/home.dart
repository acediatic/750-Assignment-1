import 'package:flutter/material.dart';
import 'package:stronger/appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Displays a transparent app bar with a heart icon on the left hand
      // side and a profile icon on the right hand side.
      appBar: StrongerAppBar(),
    );
  }
}

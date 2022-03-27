import 'package:flutter/material.dart';
import 'app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(52, 79, 161, 1),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), child: DoDayAppBar()));
  }
}

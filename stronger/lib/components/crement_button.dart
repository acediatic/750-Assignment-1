import 'dart:async';

import 'package:flutter/material.dart';

/*
 * The CrementButton class is a button that can be used to increment or decrement
 * a value. It is used in the rep counter widget to represent the number of reps, 
 * allowing the user to add or remove completed reps from the exercise.
 * 
 * It is a StatefulWidget because it needs to be able to change the value of the
 * exercise it is associated with.
 * 
 * It has two arguments to the constructor, the onclick function and the icon to use.
 */
class CrementButton extends StatefulWidget {
  const CrementButton({
    Key? key,
    required this.crement,
    required this.icon,
    timer,
  }) : super(key: key);

  final Function crement;
  final IconData icon;

  @override
  State<CrementButton> createState() => _CrementButtonState();
}

class _CrementButtonState extends State<CrementButton> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        width: 60,
        height: 60,
        child: Center(
          child: Icon(
            widget.icon,
            size: 40.0,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        widget.crement();
      },
      onTapDown: (TapDownDetails details) {
        _timer = Timer.periodic(const Duration(milliseconds: 300), (t) {
          widget.crement();
        });
      },
      onTapUp: (TapUpDetails details) {
        _timer?.cancel();
      },
      onTapCancel: () {
        _timer?.cancel();
      },
    );
  }
}

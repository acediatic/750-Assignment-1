import 'dart:async';

import 'package:flutter/material.dart';

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

import 'package:flutter/material.dart';

class DoDayAppBar extends StatelessWidget {
  const DoDayAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        Expanded(child: Container()),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.notification_add), onPressed: () {}),
      ],
    );
  }
}

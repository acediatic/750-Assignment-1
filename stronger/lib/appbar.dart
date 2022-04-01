import 'package:flutter/material.dart';

class StrongerAppBar extends StatelessWidget with PreferredSizeWidget {
  const StrongerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.favorite),
        color: Theme.of(context).colorScheme.primary,
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

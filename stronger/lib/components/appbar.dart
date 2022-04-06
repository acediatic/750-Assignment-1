import 'package:flutter/material.dart';

/*
 * This is the AppBar used by the app. It simply contains two icons,
 * one which is the logo for the app, and the other an Icon Button which
 * could be used to view user settings (not implemented).
 */
class StrongerAppBar extends StatelessWidget with PreferredSizeWidget {
  const StrongerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.favorite,
        color: Theme.of(context).colorScheme.primary,
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

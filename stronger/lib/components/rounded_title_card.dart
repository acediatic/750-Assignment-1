import 'package:flutter/material.dart';

/*
 * The RoundedTitleCard widget is a card that has a rounded border and a title.
 * It is used on the homepage to display an option. 
 */
class RoundedTitleCard extends StatelessWidget {
  final String text;
  final IconData leadingIcon;
  final String pushRoute;
  const RoundedTitleCard(
      {Key? key,
      required this.text,
      required this.leadingIcon,
      required this.pushRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, pushRoute);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  leadingIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 25,
                      ),
                ),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

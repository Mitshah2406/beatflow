import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(96, 182, 176, 176),
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
      ),
    );
  }
}

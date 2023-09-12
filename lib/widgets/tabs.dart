import 'package:beatflow/widgets/tab_item.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabItem(text: "Music"),
          SizedBox(
            width: 12,
          ),
          TabItem(text: "Podcasts & Shows")
        ],
      ),
    );
  }
}

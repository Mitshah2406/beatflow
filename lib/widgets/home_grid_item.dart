import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromARGB(31, 213, 204, 204),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/likedSongs.png"),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "Liked Songs",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

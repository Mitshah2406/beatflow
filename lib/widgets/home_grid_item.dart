import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({super.key, this.imageUrl, this.songName});
  final String? songName;
  final String? imageUrl;
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
          imageUrl != null
              ? Image.network(imageUrl!)
              : Image.asset("assets/images/likedSongs.png"),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Text(
              songName ?? "Liked Songs",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

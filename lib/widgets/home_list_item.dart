import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 250,
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          DropShadowImage(
            borderRadius: 12,
            //@blurRadius if not defined default value is
            blurRadius: 0,
            //@offset default value is Offset(8,8)
            offset: const Offset(5, 5),
            //@scale if not defined default value is 1
            scale: 1.05,
            image: Image.asset("assets/images/wishingWall.png"),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Taylor Swift, The\nWeekend, Post Malone bla bal blaaascbbghnhhnhjhjjjjjjkkj",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white60),
          )
        ],
      ),
    );
  }
}

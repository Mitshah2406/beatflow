import 'package:beatflow/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate(
          [
            // // const HomeGridItem(),
            // Container(
            //   clipBehavior: Clip.hardEdge,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(6),
            //     color: const Color.fromARGB(31, 213, 204, 204),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Image.asset("assets/images/likedSongs.png"),
            //       const SizedBox(
            //         width: 8,
            //       ),
            //       Text(
            //         data.toString(),
            //         style: const TextStyle(
            //             fontWeight: FontWeight.w600, fontSize: 15),
            //       ),
            //     ],
            //   ),
            // ),
            const HomeGridItem(),
            const HomeGridItem(),
            const HomeGridItem(),
            const HomeGridItem(),
            const HomeGridItem(),
            const HomeGridItem(),
          ],
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 3,
        ),
      ),
    );
  }
}

import 'package:beatflow/models/Songs.dart';
import 'package:beatflow/providers/api_provider.dart';
import 'package:beatflow/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class HomeGrid extends ConsumerWidget {
  HomeGrid({super.key});
  final logger = Logger();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlyPlayedSongs = ref.watch(apiProvider);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate([
          const HomeGridItem(),
          ...recentlyPlayedSongs.when(
            data: (songs) {
              logger.d(songs);
              List<Widget> myData = songs
                  .map((e) => HomeGridItem(
                        songName: e.track!.name,
                        imageUrl: e.track!.album!.images![0].url,
                      ))
                  .toList();
              return myData;
            },
            error: (Object error, StackTrace stackTrace) {
              return [Text(error.toString())];
            },
            loading: () {
              return [
                const Center(
                  child: CircularProgressIndicator(),
                )
              ];
            },
          ),
        ]),
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

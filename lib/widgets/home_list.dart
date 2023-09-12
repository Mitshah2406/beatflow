import 'package:beatflow/widgets/home_list_item.dart';
import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SizedBox(
          height: 320,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => const HomeListItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }
}

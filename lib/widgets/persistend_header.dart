import 'package:flutter/material.dart';

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  PersistentHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent =>
      child.preferredSize.height; // Set the maximum extent of the header

  @override
  double get minExtent =>
      child.preferredSize.height; // Set the minimum extent of the header

  @override
  bool shouldRebuild(covariant PersistentHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}

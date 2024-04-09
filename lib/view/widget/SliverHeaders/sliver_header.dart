import 'package:flutter/material.dart';

class SliverHeader extends StatelessWidget {
  const SliverHeader({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.floating,
    required this.pinned,
  });

  final String title;
  final Color backgroundColor;
  final bool pinned;
  final bool floating;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: pinned,
        floating: floating,
        delegate: SliverHeaderDelagate(backgroundColor, title));
  }
}

class SliverHeaderDelagate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelagate(this.backgroundColor, this.title);

  final String title;
  final Color backgroundColor;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          title,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
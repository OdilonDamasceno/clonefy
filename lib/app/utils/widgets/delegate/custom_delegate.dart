import 'package:flutter/material.dart';

class CustomDetelage extends SliverPersistentHeaderDelegate {
  TabController tabController;
  List<Widget> tabs;
  final double extend;
  final Widget child;
  Color color;
  CustomDetelage({
    Key key,
    @required this.extend,
    this.child,
    this.color = Colors.black,
  }) : assert(extend != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: extend,
      color: color,
      child: child,
    );
  }

  @override
  double get maxExtent => extend;

  @override
  double get minExtent => extend;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

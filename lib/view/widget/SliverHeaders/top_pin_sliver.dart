import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class TopPinSliver extends SingleChildRenderObjectWidget {
  const TopPinSliver({required Widget child, Key? key})
      : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTopPinSliver();
  }
}

class RenderTopPinSliver extends RenderSliverSingleBoxAdapter {
  RenderTopPinSliver({
    RenderBox? child,
  }) : super(child: child);

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    final SliverConstraints constraints = this.constraints;
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final double childExtent;
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
      case Axis.vertical:
        childExtent = child!.size.height;
    }
    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    


    geometry = SliverGeometry(
      paintOrigin:

          /// hite imidetly by scroll
          // -constraints.scrollOffset,

          /// hite after first childExtend layout by scrolling
          constraints.scrollOffset == 0
              ? 0
              : -constraints.scrollOffset,
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
    setChildParentData(child!, constraints, geometry!);

    // var cmyCnstraints = constraints;
    // geometry = SliverGeometry.zero;

    // child!.layout(
    //   constraints.asBoxConstraints(),
    //   parentUsesSize: true
    // );
    // double childExtent = child?.size.height ?? 0;

    // geometry = SliverGeometry(
    //   paintExtent: childExtent,
    //   maxPaintExtent: childExtent,
    //   paintOrigin: -constraints.scrollOffset,
    // );
    // setChildParentData(child!, constraints, geometry!);
  }
}

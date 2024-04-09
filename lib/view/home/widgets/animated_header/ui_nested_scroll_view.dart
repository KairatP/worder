import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fade_animation.dart';

class UINestedScrollView extends StatefulWidget {
  const UINestedScrollView({
    super.key,
    this.expandedHeight,
    // required this.backgroundColor,
    required this.pinned,
    // required this.stretch,
    this.toolbarHeight,
    this.expandedWidget,
    this.boxDecoration,
    this.colapsedWidget,
    this.leadingWidget,
    this.actionWidgets,
    required this.sliverList,
    this.sliverBackgroundColor, 
    this.sliverListHeaderWidget,
  });

  final double? expandedHeight;
  // final Color backgroundColor;
  final bool pinned;
  // final bool stretch;
  final double? toolbarHeight;
  final Widget? expandedWidget;
  final Widget? colapsedWidget;
  final Widget? leadingWidget;
  final List<Widget>? actionWidgets;
  final Widget? sliverListHeaderWidget;
  final BlocConsumer sliverList;
  final BoxDecoration? boxDecoration;
  final Color? sliverBackgroundColor;

  @override
  State<UINestedScrollView> createState() => _UINestedScrollViewState();
}

class _UINestedScrollViewState extends State<UINestedScrollView> {
  late double _expandedHeight;
  late double _toolbarHeight;

  double calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight -
            _toolbarHeight -
            MediaQuery.of(context).padding.top) /
        (_expandedHeight - _toolbarHeight);
    if (expandRatio > 1.0) expandRatio = 1;
    if (expandRatio < 0.0) expandRatio = 0;
    return expandRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          // backgroundColor: widget.backgroundColor,
          expandedHeight: _expandedHeight,
          pinned: widget.pinned,
          // stretch: widget.stretch,
          toolbarHeight: _toolbarHeight,
          flexibleSpace: LayoutBuilder(builder: (context, constraints) {
            final expandRatio = calculateExpandRatio(constraints);
            final animation = AlwaysStoppedAnimation(expandRatio);

            return Stack(
              children: [
                Container(
                  decoration: widget.boxDecoration,
                ),
                if (widget.expandedWidget != null)
                  Center(
                      child: FadeAnimation(
                          animation: animation,
                          isExpandedWidget: true,
                          child: widget.expandedWidget!)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: _toolbarHeight,
                    child: Row(
                      children: [
                        if (widget.leadingWidget != null) widget.leadingWidget!,
                        if (widget.colapsedWidget != null)
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.leadingWidget != null ? 0 : 20),
                            child: FadeAnimation(
                                animation: animation,
                                isExpandedWidget: false,
                                child: widget.colapsedWidget!),
                          ),
                        if (widget.actionWidgets != null)
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: widget.actionWidgets!.reversed.toList(),
                          )),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      )
    ];
  }

  Widget body() {
    return Container(
        color: widget.sliverBackgroundColor ??
            Theme.of(context).scaffoldBackgroundColor,
        child: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                /// add space to do not cover sliverList
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10,),),
                SliverToBoxAdapter(
                  child: widget.sliverListHeaderWidget ?? const SizedBox()),
                widget.sliverList,
              ],
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight =
        widget.expandedHeight ?? MediaQuery.of(context).size.height * 1.7 / 8;
    _toolbarHeight = widget.toolbarHeight ?? kToolbarHeight;
    return NestedScrollView(
        headerSliverBuilder: headerSliverBuilder, body: body());
  }
}

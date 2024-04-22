import 'package:flutter/material.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';

class BasicContainer extends StatelessWidget {
  const BasicContainer({
    super.key,
    required this.width,
    required this.child,
    required this.padding,
    required this.margin,
  });

  final double width;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.fillCollor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

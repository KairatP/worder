import 'package:flutter/material.dart';

class BotomSheetBase extends StatelessWidget {
  const BotomSheetBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: SizedBox(width: double.infinity, child: child),
    );
  }
}
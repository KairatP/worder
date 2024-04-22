import 'package:flutter/material.dart';

class BotomSheetBase extends StatelessWidget {
  const BotomSheetBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
        child: SizedBox(width: double.infinity, child: child),
    );
  }
}
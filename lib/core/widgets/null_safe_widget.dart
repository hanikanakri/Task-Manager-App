import 'package:flutter/material.dart';

class NullSafeWidget extends StatelessWidget {
  const NullSafeWidget({
    super.key,
    required this.child,
    required this.value,
    this.evade,
    this.alternative = const SizedBox(),
  });

  final Widget child;
  final dynamic value;
  final dynamic evade;
  final Widget alternative;

  @override
  Widget build(BuildContext context) {
    if (evade is! List) {
      return value != evade ? child : alternative;
    } else {
      return (evade as List).contains(value) ? alternative : child;
    }
  }
}

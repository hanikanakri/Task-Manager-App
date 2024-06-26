// ignore_for_file: must_be_immutable

import '/core/constants/app_styles.dart';
import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  BoxDecoration? decoration = AppStyles.defaultBoxDecoration.copyWith(boxShadow: AppStyles.defaultShadow);

  CustomContainer(
      {super.key,
      this.height,
      this.padding = const EdgeInsets.all(8),
      this.margin,
      required this.child,
      this.width = double.infinity,
      this.decoration}) {
    decoration ??= AppStyles.defaultBoxDecoration.copyWith(boxShadow: AppStyles.defaultShadow);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      decoration: decoration,
      child: child,
    );
  }
}

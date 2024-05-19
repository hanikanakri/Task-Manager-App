import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/animations/fade_animation.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class GeneralHomePageScaffold extends StatelessWidget {
  const GeneralHomePageScaffold({
    super.key,
    this.body,
    this.title,
  });

  final Widget? body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          title?.tr() ?? '',
          style: AppTheme.headline,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FadeAnimation(
          fadeDirection: FadeDirection.right,
          child: body,
        ),
      ),
    );
  }
}

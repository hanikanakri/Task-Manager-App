import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';
import '/core/widgets/custom_image.dart';

class AuthDetailsCard extends StatelessWidget {
  final Widget? child;
  final String? assetsName;

  final String? authName;
  final IconData? icon;
  final Color? iconColor;

  final bool svg;

  const AuthDetailsCard({
    super.key,
    this.child,
    this.svg = false,
    this.assetsName,
    this.authName,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                bottom: 50,
                top: 40,
              ),
              decoration: const BoxDecoration(
                gradient: AppColors.authColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.elliptical(450, 150),
                  bottomLeft: Radius.elliptical(450, 150),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImage.rectangle(
                    image: assetsName,
                    isNetworkImage: false,
                    width: 20,
                    svg: svg,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    authName?.tr() ?? "",
                    style: AppTheme.headline.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: child ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

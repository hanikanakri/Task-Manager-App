import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_settings.dart';
import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback? onSeeAllTap;

  const SectionTitle({super.key, required this.title, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          Text(
            title,
            style: AppTheme.headline6.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (onSeeAllTap != null)
            InkWell(
              onTap: onSeeAllTap,
              child: Text('see_all'.tr(),
                  style: TextStyle(
                      fontFamily: SharedStorage.getLanguage() == "ar"
                          ? AppSettings.arabicFont
                          : AppSettings.englishFont,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline)),
            )
        ],
      ),
    );
  }
}

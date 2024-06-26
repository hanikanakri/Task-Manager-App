import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class ColumnListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isUnderLine;

  const ColumnListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.isUnderLine = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: isUnderLine
              ? AppTheme.subtitle2.copyWith(
                  color: AppColors.grey,
                  decoration: TextDecoration.underline,
                )
              : AppTheme.subtitle2,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        if (isUnderLine)
          const SizedBox(
            height: 8,
          ),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ],
    );
  }
}

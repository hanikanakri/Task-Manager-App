import 'package:flutter/material.dart';

import '/core/constants/app_theme.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const CustomExpansionTile({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        textColor: Colors.black,
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: AppTheme.headline6,
        ),
        children: children,
      ),
    );
  }
}

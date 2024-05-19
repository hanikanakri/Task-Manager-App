import 'package:easy_localization/easy_localization.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/app_settings.dart';
import '/core/constants/app_theme.dart';

class Splash extends StatelessWidget {
  final dynamic navigator;

  const Splash({
    super.key,
    this.navigator,
  });

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 120,
      backgroundColor: AppColors.white,
      title: Text(
        'welcome_to_task_manager'.tr(),
        style: AppTheme.headline.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
      logo: Image.asset(
        AppAssets.splashLogo,
        alignment: Alignment.bottomCenter,
      ),
      showLoader: false,
      loaderColor: AppColors.primaryColor,
      loadingText: Text(
        AppSettings.appVersion,
        style: AppTheme.headline6.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      futureNavigator: futureCall(context),
    );
  }

  Future<Widget> futureCall(context) async {
    return Future.delayed(const Duration(seconds: 4), () {
      print("SharedStorage.getLanguage()");
      return navigator;
    });
  }
}

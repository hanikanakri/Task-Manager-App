class AppAssets {
  AppAssets._();

  static const String baseDbURI = 'assets/images/db/';
  static const String personDbURI = '${baseDbURI}person_image.jpg';

  static const String baseAssetsURI = 'assets/images/';
  static const String mainBackground = '${baseAssetsURI}main_background.png';
  static const String noData = '${baseAssetsURI}no_data.png';
  static const String errorData = '${baseAssetsURI}error.png';

//logo
  static const String baseLogoURI = '${baseAssetsURI}logo/';
  static const String logoURI = '${baseLogoURI}app_icon.png';
  static String splashLogo = "${baseLogoURI}splash_logo.png";

  //splash
  static const String baseSplashURI = '${baseAssetsURI}splash/';

  static const String splashBackGroundImageURI =
      '${baseSplashURI}splash_background.jpg';

  //Language
  static const String baseAuthURI = '${baseAssetsURI}auth/';
  static const String changeLanguageURI = '${baseAuthURI}changeLanguage.svg';

  //Home  asset
  static const String baseHomeURI = '${baseAssetsURI}home/';
  static const String appBackgroundURI = '${baseHomeURI}app_background_1.png';
  static const String editNoteHomePage = '${baseHomeURI}editing.png';
  static const String noteHomePage = '${baseHomeURI}notes.png';

  //asset
  static const String baseRequestURI = '${baseAssetsURI}request/';
  static const String cameraIcon = '${baseRequestURI}camera.svg';
  static const String galleryIcon = '${baseRequestURI}gallery.svg';
  static const String uploadImageIcon = '${baseRequestURI}uploadImage.svg';
  static const String saveTempIcon = '${baseRequestURI}saveTemp.svg';

  //place holder
  static const String placeHolder =
      'assets/images/place_holders/place_holder.png';

//Auth
  static const String baseAuth = "${baseAssetsURI}auth/";
  static const String loginAuth = "${baseAuth}login_auth.png";
  static const String emailAuth = "${baseAuth}email_auth.png";
  static const String passwordAuth = "${baseAuth}password_auth.png";




}

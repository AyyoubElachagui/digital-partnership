import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/shared_prefs.dart';
import 'package:flutter/cupertino.dart';

class SplashPageViewModel extends ChangeNotifier {
  final NavigationService navigationService;

  SplashPageViewModel({
    required this.navigationService,
  });

  SharedPrefs sharedPrefs = SharedPrefs();

  void defaultScreen() {
    bool isOnBoarding = sharedPrefs.IsOnboarding;
    bool isEnablePermissionLocation = sharedPrefs.IsEnablePermissionLocation;
    bool isAuth = sharedPrefs.IsAuth;
    if (isAuth == true) {
      navigationService.navigateTo(routeName: Routes.homePage);
      return;
    }

    if (isEnablePermissionLocation == true) {
      navigationService.navigateTo(routeName: Routes.welcomePage);
      return;
    }

    if (isOnBoarding == true) {
      navigationService.navigateTo(routeName: Routes.enablePermissionLocation);
      return;
    }
    navigationService.navigateTo(routeName: Routes.firstOnBoardingPage);
  }
}

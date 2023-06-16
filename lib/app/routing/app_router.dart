import 'package:digital_partnership_group/app/pages/authentication/sign_in/sign_in_page.dart';
import 'package:digital_partnership_group/app/pages/authentication/sign_up/sign_up_page.dart';
import 'package:digital_partnership_group/app/pages/enable_permisson_location_page/enable_permission_location.dart';
import 'package:digital_partnership_group/app/pages/home_page/home_page.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/notification_view/notification_view.dart';
import 'package:digital_partnership_group/app/pages/home_page/views/transport_view/transport_view.dart';
import 'package:digital_partnership_group/app/pages/onboarding_pages/first_onboarding_view.dart';
import 'package:digital_partnership_group/app/pages/onboarding_pages/last_onboarding_view.dart';
import 'package:digital_partnership_group/app/pages/onboarding_pages/second_onboarding_view.dart';
import 'package:digital_partnership_group/app/pages/splash_page/splash_page_factory.dart';
import 'package:digital_partnership_group/app/pages/welcome_page/welcome_page.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    Widget? page;
    switch (settings.name) {
      case Routes.splashPage:
        page = SplashPageFactory.build();
        break;
      case Routes.firstOnBoardingPage:
        page = const FirstOnboardingView();
        break;
      case Routes.secondOnBoardingPage:
        page = const SecondOnBoardingView();
        break;
      case Routes.lastOnBoardingPage:
        page = const LastOnBoardingView();
        break;
      case Routes.enablePermissionLocation:
        page = const EnablePermissionLocation();
        break;
      case Routes.welcomePage:
        page = const WelcomePage();
        break;
      case Routes.signIn:
        page = const SignInPage();
        break;
      case Routes.signUp:
        page = const SignUpPage();
        break;
      case Routes.homePage:
        page = const HomePage();
        break;
      case Routes.notificationView:
        page = const NotificationView();
        break;
      case Routes.transportView:
        page = const TransportView();
        break;
    }

    return MaterialPageRoute(builder: (_) => page!, settings: settings);
  }

  static Widget buildSplashPage() {
    return SplashPageFactory.build();
  }
}

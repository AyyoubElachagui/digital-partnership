import 'package:digital_partnership_group/app/pages/splash_page/splash_page.dart';
import 'package:digital_partnership_group/app/pages/splash_page/splash_page_view_model.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPageFactory {
  static Widget build() {
    return ChangeNotifierProvider<SplashPageViewModel>(
      create: (context) {
        return SplashPageViewModel(
          navigationService:
              Provider.of<NavigationService>(context, listen: false),
        );
      },
      child: Consumer<SplashPageViewModel>(
          builder: (context, model, child) => SplashPage(
                viewModel: model,
              )),
    );
  }
}

import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    ImageAssets.welcomeScreenImage,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome',
                    style: const TextStyle(
                      fontSize: 24,
                      color: ColorPalette.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      'Have a better sharing experience',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: ColorPalette.textSecondColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      navigationService.navigateTo(routeName: Routes.signUp);
                    },
                    text: 'Create an account',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    hasBorder: true,
                    onPressed: () {
                      navigationService.navigateTo(routeName: Routes.signIn);
                    },
                    text: 'Log In',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

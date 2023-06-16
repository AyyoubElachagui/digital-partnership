import 'package:digital_partnership_group/app/pages/onboarding_pages/widgets/onboarding_button.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastOnBoardingView extends StatefulWidget {
  const LastOnBoardingView({Key? key}) : super(key: key);

  @override
  State<LastOnBoardingView> createState() => _LastOnBoardingViewState();
}

class _LastOnBoardingViewState extends State<LastOnBoardingView> {
  @override
  Widget build(BuildContext context) {
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        navigationService.navigateToAndMakeRoot(
                            routeName: Routes.welcomePage);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        ImageAssets.OnBoardingImage1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Book your car',
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
                          'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
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
                ],
              ),
              OnBoardingButton(
                initialValue: 66,
                endValue: 100,
                onClicked: () {
                  navigationService.navigateToAndMakeRoot(
                    routeName: Routes.enablePermissionLocation,
                  );
                },
                child: const Center(
                  child: Text(
                    "Go",
                    style: TextStyle(
                        color: ColorPalette.textPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

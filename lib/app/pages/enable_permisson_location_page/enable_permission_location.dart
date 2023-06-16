import 'package:digital_partnership_group/app/pages/onboarding_pages/widgets/onboarding_button.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/utils/shared_prefs.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnablePermissionLocation extends StatefulWidget {
  const EnablePermissionLocation({Key? key}) : super(key: key);

  @override
  State<EnablePermissionLocation> createState() =>
      _EnablePermissionLocationState();
}

class _EnablePermissionLocationState extends State<EnablePermissionLocation> {
  SharedPrefs sharedPrefs = SharedPrefs();
  @override
  void initState() {
    super.initState();
    sharedPrefs.setIsOnboarding(true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDataAlert();
    });
  }

  showDataAlert() {
    final NavigationService navigationService =
        Provider.of<NavigationService>(context, listen: false);

    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
          content: Container(
            height: 400,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OnBoardingButton(
                  initialValue: 0,
                  endValue: 0,
                  onClicked: () {},
                  child: const Icon(
                    Icons.location_pin,
                    color: ColorPalette.textPrimaryColor,
                  ),
                ),
                Text(
                  'Enable your location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.textPrimaryColor,
                  ),
                ),
                Container(
                  width: 250,
                  child: Text(
                    'Choose your location to start find the request around you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette.textSecondColor,
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    sharedPrefs.setIsEnablePermissionLocation(true);
                    navigationService.navigateToAndMakeRoot(
                        routeName: Routes.welcomePage);
                  },
                  text: "Use my location",
                ),
                TextButton(
                  onPressed: () {
                    sharedPrefs.setIsEnablePermissionLocation(true);
                    navigationService.navigateToAndMakeRoot(
                        routeName: Routes.welcomePage);
                  },
                  child: Text(
                    'Skip for now',
                    style: TextStyle(
                      color: ColorPalette.textSecondColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.mapImage),
          ),
        ),
      ),
    );
  }
}

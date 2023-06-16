import 'package:digital_partnership_group/app/pages/authentication/sign_up/widgets/complete_your_profile.dart';
import 'package:digital_partnership_group/app/pages/authentication/sign_up/widgets/sign_up_form.dart';
import 'package:digital_partnership_group/app/pages/authentication/views/otp_verification.dart';
import 'package:digital_partnership_group/app/pages/authentication/views/set_password.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/shared_prefs.dart';
import 'package:digital_partnership_group/app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButtonWidget(
                      onClickBack: () {
                        setState(() {
                          index--;
                        });
                        if (index < 0) {
                          Navigator.pop(context);
                          return;
                        }
                      },
                    ),
                    if (index == 3) ...[
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.textPrimaryColor,
                          fontSize: 18,
                        ),
                      )
                    ]
                  ],
                ),
                _buildWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    final SharedPrefs sharedPrefs = SharedPrefs();
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);
    List<Widget> widgets = [
      SignUpForm(
        moveToNext: () {
          setState(() {
            index++;
          });
        },
      ),
      OtpVerification(
        moveToNext: () {
          setState(() {
            index++;
          });
        },
      ),
      SetPassword(
        moveToNext: () {
          setState(() {
            index++;
          });
        },
      ),
      CompleteYourProfile(
        moveToNext: () {
          setState(() {
            index++;
          });
        },
        moveToPrev: () {
          sharedPrefs.setIsAuth(true);
          navigationService.navigateToAndMakeRoot(routeName: Routes.homePage);
        },
      ),
    ];
    return index < 0 ? SizedBox() : widgets[index];
  }
}

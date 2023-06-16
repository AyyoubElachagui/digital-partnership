import 'package:digital_partnership_group/app/pages/authentication/sign_in/widgets/sign_in_form.dart';
import 'package:digital_partnership_group/app/pages/authentication/sign_in/widgets/verification_email.dart';
import 'package:digital_partnership_group/app/pages/authentication/views/otp_verification.dart';
import 'package:digital_partnership_group/app/pages/authentication/views/set_password.dart';
import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/shared_prefs.dart';
import 'package:digital_partnership_group/app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              _buildWidget(),
            ],
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
      SignInForm(
        moveToNext: () {
          setState(() {
            index++;
          });
        },
      ),
      VerificationEmail(
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
        isNewPassword: true,
        moveToNext: () {
          sharedPrefs.setIsAuth(true);
          navigationService.navigateToAndMakeRoot(routeName: Routes.homePage);
        },
      ),
    ];
    return index < 0 ? SizedBox() : widgets[index];
  }
}

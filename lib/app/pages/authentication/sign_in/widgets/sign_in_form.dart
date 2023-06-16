import 'package:digital_partnership_group/app/pages/authentication/views/social_media_auth.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  final Function() moveToNext;
  const SignInForm({
    Key? key,
    required this.moveToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              child: Text(
                "Sign in with your email or phone number",
                style: TextStyle(
                    fontSize: 24, color: ColorPalette.textPrimaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Email or Phone Number',
              controller: TextEditingController(),
            ),
            CustomTextField(
              hintText: 'Enter Your Password',
              isPassword: true,
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget password?',
                style: TextStyle(
                  color: ColorPalette.textRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: moveToNext,
              text: 'Sign up',
            ),
            SocialMediaAuth(
              moveToNext: moveToNext,
              text: 'Don’t have an account?',
              hyperText: ' Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}

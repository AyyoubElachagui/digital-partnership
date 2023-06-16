import 'package:digital_partnership_group/app/pages/authentication/views/social_media_auth.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_drop_down.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpForm extends StatelessWidget {
  final Function() moveToNext;
  SignUpForm({Key? key, required this.moveToNext}) : super(key: key);

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
                "Sign up with your email or phone number",
                style: TextStyle(
                    fontSize: 24, color: ColorPalette.textPrimaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Name',
              controller: TextEditingController(),
            ),
            CustomTextField(
              hintText: 'Email',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 10,
            ),
            IntlPhoneField(
              disableLengthCheck: true,
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined),
              decoration: InputDecoration(
                hintText: 'Your mobile number',
                hintStyle: TextStyle(color: ColorPalette.hintTextColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: ColorPalette.greyColor, width: 0.3),
                ),
              ),
              initialCountryCode: 'MA',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomDropDown(
              onChanged: (value) {},
              items: ['Male', ' Female'],
              hintText: 'Gender',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: ColorPalette.kGreen,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By signing up. you agree to the',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorPalette.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of service ',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorPalette.kGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorPalette.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy policy',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorPalette.kGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              onPressed: moveToNext,
              text: 'Sign up',
            ),
            SocialMediaAuth(
              text: 'Already have an account?',
              hyperText: ' Sign in',
              moveToNext: moveToNext,
            ),
          ],
        ),
      ),
    );
  }
}

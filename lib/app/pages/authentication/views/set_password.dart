import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SetPassword extends StatelessWidget {
  final Function() moveToNext;
  final bool isNewPassword;
  const SetPassword({
    Key? key,
    required this.moveToNext,
    this.isNewPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Set ${isNewPassword ? 'new ' : ''}password",
                          style: TextStyle(
                              fontSize: 24,
                              color: ColorPalette.textPrimaryColor),
                        ),
                        Text(
                          "Set your  ${isNewPassword ? 'new ' : ''}password",
                          style: TextStyle(color: ColorPalette.textSecondColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  isPassword: true,
                  hintText: 'Enter Your Password',
                ),
                CustomTextField(
                  controller: TextEditingController(),
                  isPassword: true,
                  hintText: 'Confirm Password',
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn’t receive code?',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorPalette.hintTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' Resend again',
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
              height: 200,
            ),
            CustomButton(
              onPressed: moveToNext,
              text: "Verify",
            ),
          ],
        ),
      ),
    );
  }
}

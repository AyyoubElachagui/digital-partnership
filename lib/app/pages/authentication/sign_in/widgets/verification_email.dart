import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class VerificationEmail extends StatelessWidget {
  final Function() moveToNext;
  const VerificationEmail({
    Key? key,
    required this.moveToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
          ],
        ),
        SizedBox(
          height: 200,
        ),
        CustomButton(
          onPressed: moveToNext,
          text: 'Send OTP',
        ),
      ],
    );
  }
}

import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SocialMediaAuth extends StatelessWidget {
  final Function() moveToNext;
  final String text;
  final String hyperText;
  const SocialMediaAuth({
    Key? key,
    required this.moveToNext,
    required this.text,
    required this.hyperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: ColorPalette.hintTextColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "or",
                style: TextStyle(color: ColorPalette.hintTextColor),
              ),
            ),
            Expanded(
              child: Divider(
                color: ColorPalette.hintTextColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton(
          icon: ImageAssets.gmailImage,
          borderColor: ColorPalette.hintTextColor,
          hasBorder: true,
          onPressed: moveToNext,
          text: 'Sign up with Gmail',
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          icon: ImageAssets.facebookImage,
          borderColor: ColorPalette.hintTextColor,
          hasBorder: true,
          onPressed: moveToNext,
          text: 'Sign up with Facebook',
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          icon: ImageAssets.gmailImage,
          borderColor: ColorPalette.hintTextColor,
          hasBorder: true,
          onPressed: moveToNext,
          text: 'Sign up with Apple',
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: text,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorPalette.hintTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: hyperText,
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
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

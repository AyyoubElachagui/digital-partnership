import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool hasBorder;
  final Color? borderColor;
  final String? icon;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.hasBorder = false,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('$icon'),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(
                      color: hasBorder == true
                          ? borderColor != null
                              ? ColorPalette.textPrimaryColor
                              : ColorPalette.kGreen
                          : ColorPalette.white,
                    ),
                  ),
                ],
              )
            : Text(
                "$text",
                style: TextStyle(
                  color: hasBorder == true
                      ? borderColor != null
                          ? ColorPalette.textPrimaryColor
                          : ColorPalette.kGreen
                      : ColorPalette.white,
                ),
              ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(hasBorder == false
              ? ColorPalette.btnPrimaryColor
              : ColorPalette.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: borderColor != null
                      ? borderColor!
                      : ColorPalette.btnPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Function() onClickBack;
  final String title;
  final bool hasTitle;
  const BackButtonWidget(
      {Key? key,
      required this.onClickBack,
      this.title = '',
      this.hasTitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickBack,
      child: hasTitle == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: ColorPalette.textPrimaryColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: ColorPalette.textPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    Container(),
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textPrimaryColor),
                ),
                SizedBox(),
              ],
            )
          : Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorPalette.textPrimaryColor,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Back',
                  style: TextStyle(
                    color: ColorPalette.textPrimaryColor,
                    fontSize: 16,
                  ),
                )
              ],
            ),
    );
  }
}

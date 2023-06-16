import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/core/data/models/favourite_model.dart';
import 'package:flutter/material.dart';

class CardFavourite extends StatelessWidget {
  const CardFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorPalette.kGreen, width: 0.8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_pin,
            size: 20,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favouriteModel.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textPrimaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  favouriteModel.subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.textNeutralColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.block,
            size: 20,
            color: ColorPalette.textRed,
          ),
        ],
      ),
    );
  }
}

import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String money;
  final String label;

  const BalanceCard({
    Key? key,
    required this.money,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorPalette.kGreen, width: 0.8),
        color: ColorPalette.kGreen.withOpacity(0.3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            money,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: ColorPalette.textPrimaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: ColorPalette.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

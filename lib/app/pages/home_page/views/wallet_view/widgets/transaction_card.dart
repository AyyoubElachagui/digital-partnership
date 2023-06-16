import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/core/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final bool isNegative;
  const TransactionCard({
    Key? key,
    required this.isNegative,
  }) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isNegative
                  ? ColorPalette.kGreen.withOpacity(0.3)
                  : ColorPalette.textRed.withOpacity(0.3),
            ),
            child: Icon(
              Icons.arrow_upward_rounded,
              color: isNegative ? ColorPalette.kGreen : ColorPalette.textRed,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionModel.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.textPrimaryColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  transactionModel.subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.textNeutralColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${!isNegative ? '-' : ''}\$${transactionModel.pricing}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPalette.textPrimaryColor),
          ),
        ],
      ),
    );
  }
}

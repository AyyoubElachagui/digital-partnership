import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/core/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final bool hasBackground;
  const NotificationCard({
    Key? key,
    required this.hasBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: hasBackground
              ? Colors.transparent
              : ColorPalette.bgNotificationCard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: ColorPalette.textPrimaryColor,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            notificationModel.description,
            style: TextStyle(
              fontSize: 12,
              color: ColorPalette.textNeutralColor,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            notificationModel.dateString,
            style: TextStyle(
              fontSize: 12,
              color: ColorPalette.textNeutralColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:digital_partnership_group/app/pages/home_page/views/notification_view/widgets/notification_card.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/back_button.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              BackButtonWidget(
                hasTitle: true,
                title: 'Notification',
                onClickBack: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.textPrimaryColor,
                        ),
                      ),
                      ...List.generate(
                        2,
                        (index) => NotificationCard(
                          hasBackground: (index % 2) != 0,
                        ),
                      ).toList(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Yesterday",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.textPrimaryColor,
                        ),
                      ),
                      ...List.generate(
                        10,
                        (index) => NotificationCard(
                          hasBackground: (index % 2) != 0,
                        ),
                      ).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

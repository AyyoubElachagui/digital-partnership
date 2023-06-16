import 'package:digital_partnership_group/app/pages/home_page/views/transport_view/widgets/card_transport.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/back_button.dart';
import 'package:flutter/material.dart';

class TransportView extends StatelessWidget {
  const TransportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(
                onClickBack: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Avaiable cars for ride",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.textPrimaryColor,
                ),
              ),
              Text(
                "18 cars found",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.textNeutralColor,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        10,
                        (index) => CardTransport(
                          onClicked: () => Navigator.pop(context),
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

import 'package:digital_partnership_group/app/pages/home_page/views/offer_view/widgets/offer_card.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class OfferView extends StatelessWidget {
  const OfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(8, (index) => OfferCard()).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

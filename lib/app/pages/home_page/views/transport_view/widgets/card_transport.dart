import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/core/data/models/car_model.dart';
import 'package:flutter/material.dart';

class CardTransport extends StatelessWidget {
  final Function() onClicked;
  const CardTransport({Key? key, required this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorPalette.kGreen, width: 0.8),
        color: ColorPalette.kGreen.withOpacity(0.3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carModel.model,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.textPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${carModel.gearType} | 3 seats | ${carModel.fuelType}',
                      style: TextStyle(
                        fontSize: 13,
                        color: ColorPalette.textSecondColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 14,
                        ),
                        Text(
                          '${carModel.distance}',
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorPalette.textPrimaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Image.asset(
                carModel.carImage,
                width: 100,
                height: 60,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: onClicked,
            text: 'View car list',
          ),
        ],
      ),
    );
  }
}

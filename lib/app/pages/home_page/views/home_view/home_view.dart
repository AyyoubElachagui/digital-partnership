import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAssets.mapHomeScreenImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              bottom: 140,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: CustomButton(
                            onPressed: () {
                              navigationService.navigateTo(
                                  routeName: Routes.transportView);
                            },
                            text: 'Rental',
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorPalette.white,
                          ),
                          child: Icon(Icons.location_searching),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: ColorPalette.kGreen, width: 0.8),
                        color: ColorPalette.kGreen.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: TextEditingController(),
                            hasBackground: true,
                            hintText: 'Where would you go?',
                            hasPrefix: true,
                            prefixIcon: Icons.search,
                            suffixIcon: CupertinoIcons.heart,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    navigationService.navigateTo(
                                        routeName: Routes.transportView);
                                  },
                                  text: 'Transport',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomButton(
                                  hasBorder: true,
                                  onPressed: () {
                                    navigationService.navigateTo(
                                        routeName: Routes.transportView);
                                  },
                                  text: 'Delivery',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:digital_partnership_group/app/pages/home_page/widgets/bottom_navigaton_bar_button.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final ValueChanged<int> indexSelected;
  const BottomNavigationBarWidget({Key? key, required this.indexSelected})
      : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BottomNavigationBarButton(
                        noMargin: true,
                        isSelected: index == 0,
                        icon: CupertinoIcons.house_alt_fill,
                        label: 'Home',
                        onTap: () {
                          setState(() {
                            index = 0;
                            widget.indexSelected(index);
                          });
                        },
                      ),
                      BottomNavigationBarButton(
                        isSelected: index == 1,
                        icon: CupertinoIcons.suit_heart,
                        label: 'Favourite',
                        onTap: () {
                          setState(() {
                            index = 1;
                            widget.indexSelected(index);
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      BottomNavigationBarButton(
                        isSelected: index == 3,
                        icon: Icons.settings_input_svideo_rounded,
                        label: 'Offer',
                        onTap: () {
                          setState(() {
                            index = 3;
                            widget.indexSelected(index);
                          });
                        },
                      ),
                      BottomNavigationBarButton(
                        noMargin: true,
                        icon: Icons.manage_accounts_rounded,
                        isSelected: index == 4,
                        label: 'Profile',
                        onTap: () {
                          setState(() {
                            index = 4;
                            widget.indexSelected(index);
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                    widget.indexSelected(index);
                  });
                },
                child: Center(
                  child: Column(
                    children: [
                      Transform.rotate(
                        angle: 1.6,
                        child: ClipPath(
                          clipper: HexagonalClipper(),
                          child: Container(
                            height: 80,
                            width: 90,
                            color: ColorPalette.kGreen,
                            child: Transform.rotate(
                              angle: -1.6,
                              child: Center(
                                  child: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: ColorPalette.white,
                                size: 34,
                              )),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: index == 2
                              ? ColorPalette.kGreen
                              : ColorPalette.textPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

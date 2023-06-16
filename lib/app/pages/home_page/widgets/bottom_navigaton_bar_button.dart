import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;
  final bool noMargin;
  final bool isSelected;
  const BottomNavigationBarButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.noMargin = false,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: noMargin ? 0 : 25),
        child: Center(
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected
                    ? ColorPalette.kGreen
                    : ColorPalette.textPrimaryColor,
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? ColorPalette.kGreen
                      : ColorPalette.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

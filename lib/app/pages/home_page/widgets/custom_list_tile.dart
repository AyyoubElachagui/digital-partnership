import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String label;
  final bool isLast;
  const CustomListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isLast ? Colors.transparent : ColorPalette.greyColor,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 20,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}

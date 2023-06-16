import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final String? itemSelected;
  const CustomDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.itemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorPalette.greyColor)),
      child: DropdownButton<String>(
        isExpanded: true,
        value: itemSelected != null ? itemSelected : null,
        padding: EdgeInsets.symmetric(horizontal: 10),
        underline: DropdownButtonHideUnderline(child: Container()),
        hint: Text(
          hintText,
          style: TextStyle(color: ColorPalette.hintTextColor),
        ),
        style: TextStyle(
          color: ColorPalette.textPrimaryColor,
          fontWeight:
              itemSelected != null ? FontWeight.bold : FontWeight.normal,
        ),
        items: items.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          onChanged('$value');
        },
      ),
    );
  }
}

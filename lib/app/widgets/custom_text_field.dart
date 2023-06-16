import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool hasPrefix;
  final bool hasBackground;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.hasPrefix = false,
    this.hasBackground = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPassword = false;

  @override
  void initState() {
    super.initState();
    isPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: isPassword,
        controller: widget.controller,
        decoration: new InputDecoration(
          filled: widget.hasBackground,
          fillColor:
              widget.hasBackground ? ColorPalette.white.withOpacity(0.5) : null,
          prefixIcon: widget.hasPrefix
              ? Icon(
                  widget.prefixIcon,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: widget.hasBackground
                  ? ColorPalette.greyColor
                  : ColorPalette.hintTextColor),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: ColorPalette.greyColor, width: 0.3),
          ),
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon)
              : widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(!isPassword
                          ? CupertinoIcons.eye_fill
                          : CupertinoIcons.eye_slash_fill),
                    )
                  : null,
        ),
      ),
    );
  }
}

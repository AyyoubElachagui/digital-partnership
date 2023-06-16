import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatefulWidget {
  final Function() moveToNext;
  const OtpVerification({
    Key? key,
    required this.moveToNext,
  }) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Phone verification",
                      style: TextStyle(
                          fontSize: 24, color: ColorPalette.textPrimaryColor),
                    ),
                    Text(
                      "Enter your OTP code",
                      style: TextStyle(color: ColorPalette.textSecondColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                numberField(1),
                numberField(2),
                numberField(3),
                numberField(4),
                numberField(5),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t receive code?',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorPalette.hintTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' Resend again',
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorPalette.kGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 150,
        ),
        CustomButton(
          onPressed: widget.moveToNext,
          text: "Verify",
        ),
      ],
    );
  }

  Widget numberField(int id) {
    return SizedBox(
      width: 50,
      height: 48,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1 && id < 6) {
            FocusScope.of(context).nextFocus();
            return;
          }
          if (value.isEmpty && id > 1) {
            FocusScope.of(context).previousFocus();
            return;
          }
        },
        autofocus: true,
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        keyboardType: TextInputType.phone,
        readOnly: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.greyColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

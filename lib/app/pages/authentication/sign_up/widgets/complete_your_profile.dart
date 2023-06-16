import 'dart:io';

import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_drop_down.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CompleteYourProfile extends StatefulWidget {
  final Function() moveToPrev;
  final Function() moveToNext;
  const CompleteYourProfile({
    Key? key,
    required this.moveToNext,
    required this.moveToPrev,
  }) : super(key: key);

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  XFile? _image;

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 120,
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  XFile? selectedImages =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  setState(() {
                    _image = selectedImages;
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
              ),
              ListTile(
                onTap: () async {
                  XFile? selectedImages = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = selectedImages;
                  });
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: ColorPalette.greyColor,
                      shape: BoxShape.circle,
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(
                                File(_image!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorPalette.kGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.photo_camera,
                        color: ColorPalette.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Full Name',
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: IntlPhoneField(
                disableLengthCheck: true,
                dropdownIconPosition: IconPosition.trailing,
                dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined),
                decoration: InputDecoration(
                  hintText: 'Your mobile number',
                  hintStyle: TextStyle(color: ColorPalette.hintTextColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: ColorPalette.greyColor, width: 0.3),
                  ),
                ),
                initialCountryCode: 'MA',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Email',
            ),
            CustomTextField(
              controller: TextEditingController(),
              hintText: 'Street',
            ),
            CustomDropDown(
              items: ['Rabat', 'Casablanca', 'Fes', 'Tanger'],
              onChanged: (value) {},
              hintText: 'City',
            ),
            CustomDropDown(
              items: ['District1', 'District2', 'District3', 'District4'],
              onChanged: (value) {},
              hintText: 'District',
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    hasBorder: true,
                    onPressed: widget.moveToPrev,
                    text: "Cancel",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: widget.moveToNext,
                    text: "Save",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

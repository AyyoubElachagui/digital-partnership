import 'dart:io';

import 'package:digital_partnership_group/app/routing/navigation_service.dart';
import 'package:digital_partnership_group/app/routing/routes.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:digital_partnership_group/app/utils/image_assets.dart';
import 'package:digital_partnership_group/app/utils/shared_prefs.dart';
import 'package:digital_partnership_group/app/widgets/custom_button.dart';
import 'package:digital_partnership_group/app/widgets/custom_drop_down.dart';
import 'package:digital_partnership_group/app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  SharedPrefs sharedPrefs = SharedPrefs();
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

  NavigationService get navigationService =>
      Provider.of<NavigationService>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          width: double.infinity,
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
                            : DecorationImage(
                                image: AssetImage(
                                  ImageAssets.avatarImage,
                                ),
                                fit: BoxFit.cover,
                              ),
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
                controller: TextEditingController()..text = 'nate@email.con',
                hintText: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              IntlPhoneField(
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
              SizedBox(
                height: 10,
              ),
              CustomDropDown(
                items: ['Male', 'Female'],
                itemSelected: 'Male',
                onChanged: (val) {},
                hintText: 'Gender',
              ),
              CustomTextField(
                controller: TextEditingController()..text = 'Address',
                hintText: 'Address',
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                hasBorder: true,
                onPressed: () {
                  sharedPrefs.setIsAuth(false);
                  navigationService.navigateToAndMakeRoot(
                      routeName: Routes.splashPage);
                },
                text: 'Log out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

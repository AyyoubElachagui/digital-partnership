import 'package:digital_partnership_group/app/pages/splash_page/splash_page_view_model.dart';
import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final SplashPageViewModel viewModel;

  const SplashPage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      widget.viewModel.defaultScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Container(
        color: ColorPalette.white,
        child: const Center(
          child: CircularProgressIndicator(
            color: ColorPalette.kGreen,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}

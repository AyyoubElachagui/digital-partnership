import 'dart:math';

import 'package:digital_partnership_group/app/utils/color_palette.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatefulWidget {
  final double endValue;
  final double initialValue;
  final Function() onClicked;
  final Widget child;

  const OnBoardingButton({
    Key? key,
    required this.initialValue,
    required this.endValue,
    required this.child,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<OnBoardingButton> createState() => _CircleProgressState();
}

class _CircleProgressState extends State<OnBoardingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = Tween(begin: widget.initialValue, end: widget.endValue)
        .animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  void dispose() {
    animation.removeListener(() {});
    progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomPaint(
        // this will add custom painter after child
        foregroundPainter: CircleProgress(animation.value),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.kGreen,
              ),
              child: InkWell(
                onTap: widget.onClicked,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 5
      ..color = ColorPalette.kGreen.withOpacity(0.4)
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 5
      ..color = ColorPalette.kGreen
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

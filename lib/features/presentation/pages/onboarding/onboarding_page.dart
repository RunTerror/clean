import 'dart:math';

import 'package:flutter/material.dart';
import 'package:map/core/services/size_config.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getRandomColor(),
    );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
      1.0, // Alpha value (opacity)
    );
  }
}

class Nextbutton extends StatelessWidget {
  final VoidCallback function;
  const Nextbutton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.blue,
        ),
        width: SizeConfig.screenWidth / 8,
        height: SizeConfig.screenWidth / 8,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          width: SizeConfig.screenWidth / 12,
          height: SizeConfig.screenWidth / 12,
          child: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}

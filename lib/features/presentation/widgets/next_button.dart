import 'package:flutter/material.dart';
import 'package:map/core/services/size_config.dart';

class Buttons {
  Widget nextButton(VoidCallback function) {
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

  Widget customButton(Widget widget, VoidCallback function) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.screenHeight / 12,
        width: SizeConfig.screenWidth / 2.5,
        decoration: const BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: widget,
      ),
    );
  }
}

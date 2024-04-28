import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:map/core/services/size_config.dart';

Widget separator() {
  return Column(
    children: [
      Gap(SizeConfig.screenHeight / 30),
      const Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      Gap(SizeConfig.screenHeight / 60)
    ],
  );
}

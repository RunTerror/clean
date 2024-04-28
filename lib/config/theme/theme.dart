import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData myTheme = ThemeData(
    fontFamily: 'futura_bold',
    // Define primary colors
    primaryColor: const Color(0xFF222375),
    hintColor: const Color.fromARGB(255, 105, 103, 103),

    // const Color kYellow = Color(0xFFFDBB2C);
// const Color kBlue = Color(0xFF222375);
// const Color lightkBlue = Color(0xFF535393);
// const Color kLightBlue = Color(0xFFE8F1F8);
// const Color kBlack = Color(0xFF343434);
// const Color shimmerSkeletonColor = Color(0xff4e4f91);
// const Color hintColor = Colors.black54; // Hint Text Color

    // Define text themes
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'futura_bold'),
      displayMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w800, fontFamily: 'futura_bold'),
      bodyLarge: TextStyle(fontSize: 16, fontFamily: 'futura_bold'),
    ),

    // Define other theme properties such as fonts, buttons, etc.
  );
}

import 'package:flutter/cupertino.dart';

class ImagePath {
  static const String avatar = 'assets/images/avatar2.webp';
  static const String brew = 'assets/images/brew.png';
  static const String cappuccino = 'assets/images/cappucino.png';
  static const String espresso = 'assets/images/espresso.png';
  static const String onboarding = 'assets/images/onboarding.png';
}

class ContextVariables {
  // Sizes
  static width(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width;

  static height(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .height;
}
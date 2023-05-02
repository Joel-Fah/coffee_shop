import 'package:coffee_shop/ui/components/palette.dart';
import 'package:coffee_shop/ui/pages/onboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.myPaletteDark,
        textTheme: GoogleFonts.poppinsTextTheme()
      ),
      title: 'Coffee Shop',
      home: const OnboardPage(),
    );
  }
}
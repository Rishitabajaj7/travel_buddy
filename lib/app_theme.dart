import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const pageBackground = Color(0xFFF3F5F5);
  static const dark = Color(0xFF202326);
  static const teal = Color(0xFF61B9C1);
  static const coral = Color(0xFFE89579);
  static const yellow = Color(0xFFF3C969);
  static const backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF80C9D1), Color(0xFF3B6973)],
  );

  static ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: pageBackground,
      textTheme: GoogleFonts.poppinsTextTheme(),
      colorScheme: ColorScheme.fromSeed(seedColor: dark),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: dark,
      ),
    );
  }
}

Widget appButton(
  BuildContext context,
  String text, {
  VoidCallback? onPressed,
}) {
  return SizedBox(
    height: 50,
    child: FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      ),
      child: Text(text),
    ),
  );
}

void openPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const headerText = 'Dynamic Grade Calculator';

  static final TextStyle headerTextStyle = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle bodyTextStyle = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static final BorderRadius borderRadius = BorderRadius.circular(10);
}

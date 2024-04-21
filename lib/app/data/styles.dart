import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontRegularStyle({Color? color, double? fontSize, TextDecoration? decoration}) {
  return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      decoration: decoration
  );
}

TextStyle fontMediumStyle({Color? color, double? fontSize, TextDecoration? decoration}) {
  return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      decoration: decoration
  );
}

TextStyle fontSemiBoldStyle({Color? color, double? fontSize, TextDecoration? decoration}) {
  return GoogleFonts.montserrat(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: decoration
  );
}
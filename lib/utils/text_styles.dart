import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle ralewayW800() => GoogleFonts.raleway(
      fontWeight: FontWeight.w800,
    );

TextStyle raleway25W700() => GoogleFonts.raleway(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 25,
    );

TextStyle ralewayW600({Color color = Colors.white}) => GoogleFonts.raleway(
      fontWeight: FontWeight.w600,
      color: color,
    );

TextStyle raleway16W600({Color color = Colors.white}) => GoogleFonts.raleway(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 16,
    );

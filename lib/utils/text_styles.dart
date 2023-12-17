import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle quicksandW800() => GoogleFonts.quicksand(
      fontWeight: FontWeight.w800,
    );

TextStyle quicksand25W700() => GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 25,
    );

TextStyle quicksandW600({Color color = Colors.white ,double size = 16}) => GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      color: color,
  fontSize: size,
    );

TextStyle quicksand16W600({Color color = Colors.white}) => GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      color: color,
      fontSize: 16,
    );

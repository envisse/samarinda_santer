import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextStyling { headlineLarge, headlineMedium, headlineSmall, headlineVerySmall, bodyLarge, bodyMedium, bodySmall }

class TextWidget extends StatelessWidget {
  //required
  final String text;
  final TextStyling textStyling;

  //optional
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;

  //constructor
  const TextWidget({
    super.key,
    required this.text,
    required this.textStyling,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.textAlign,
    this.maxLines,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (textStyling) {
      case (TextStyling.headlineLarge):
        textStyle = GoogleFonts.roboto(
          fontSize: 28,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      case (TextStyling.headlineMedium):
        textStyle = GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      case (TextStyling.headlineSmall):
        textStyle = GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      case (TextStyling.headlineVerySmall):
        textStyle = GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      case (TextStyling.bodyLarge):
        textStyle = GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      case (TextStyling.bodyMedium):
        textStyle = GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
        break;
      default:
        textStyle = GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          letterSpacing: letterSpacing,
          decoration: decoration,
        );
    }

    return Text(
      text,
      maxLines: maxLines,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: textStyle,
    );
  }
}

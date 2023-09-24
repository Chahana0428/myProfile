import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final String? data;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final List<Shadow>? shadows;
  final TextDecoration? textDecoration;
  final String? fontFamily;

  TextView(this.data,
      {this.textAlign,
      this.textOverflow = TextOverflow.visible,
      this.maxLines,
      this.textColor = Colors.black,
      this.backgroundColor,
      this.fontSize = 14.0,
      this.fontWeight,
      this.fontStyle,
      this.letterSpacing,
      this.wordSpacing,
      this.shadows,
      this.textDecoration,
      this.fontFamily = 'jost'});

  @override
  Widget build(BuildContext context) {
    return Text(data ?? '',
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        style: GoogleFonts.mooli(
          color: textColor,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          shadows: shadows,
          decoration: textDecoration,
        ));
  }
}

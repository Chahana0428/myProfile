import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class EditText extends StatelessWidget {
  final TextEditingController controller;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final Color? textColor;
  final String? lableText;
  final TextStyle? lableStyle;
  final String? hint;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final double? cursorHeight;
  final Color borderColor;
  final double? errorTextHeight;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? autoCorrect;
  bool? obscureText = false;
  final int? maxLength;
  final bool? filled;
  final InputBorder? border;
  final Color? cursorColor;
  final Color? fillColor;
  bool? showRectangularInputBorder = true;
  bool? showBorder = false;
  BorderSide? borderSide;
  final EdgeInsets? contentPadding;
  final FormFieldValidator<String>? validator;
  final int? minLines;
  final int? maxLines;
  final bool? enable;
  final bool? enableSuggestions;
  final bool? enableInteractiveSelection;
  final TextAlign? textAlign;
  final TextInputAction? inputAction;
  final double? height;
  final Color? bdColor;
  ValueChanged<String>? onChanged;
  final Function(String value)? onFieldSubmitted;
  BorderRadiusGeometry? bdborderRadius;
  final bool? autofocus;

  EditText({
    this.height,
    this.onChanged,
    this.bdColor,
    this.focusNode,
    this.onTap,
    this.borderColor = Colors.transparent,
    required this.controller,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
    this.textColor,
    this.lableText,
    this.bdborderRadius,
    this.lableStyle,
    this.hint,
    this.cursorHeight = 10,
    this.cursorColor = Colors.blue,
    this.hintStyle,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
    this.inputType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.autoCorrect = true,
    this.obscureText = false,
    this.maxLength,
    this.filled,
    this.fillColor,
    this.showRectangularInputBorder = false,
    this.showBorder = false,
    this.borderSide,
    this.contentPadding,
    this.validator,
    this.minLines = 1,
    this.maxLines,
    this.errorTextHeight = 10,
    this.enable = true,
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.textAlign = TextAlign.start,
    this.inputAction,
    this.onFieldSubmitted,
    this.autofocus,
  }) {
    if (showRectangularInputBorder! && (showBorder == null)) {
      showBorder = true;
    }
    borderSide ??= const BorderSide();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        autofocus: autofocus ?? false,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        keyboardType: inputType,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization!,
        autocorrect: autoCorrect!,
        obscureText: obscureText!,
        validator: validator,
        maxLength: maxLength,
        cursorColor: cursorColor,
        autovalidateMode: AutovalidateMode.disabled,
        style: textStyle,
        decoration: InputDecoration(
          hintText: hint,
          labelText: lableText,
          labelStyle: lableStyle,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled,
          counterText: '',
          fillColor: fillColor,
          border: border,
          hintStyle: hintStyle,
          errorStyle: GoogleFonts.mooli(
              textStyle: TextStyle(
            fontSize: errorTextHeight,
            color: Colors.red,
          )),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          contentPadding: contentPadding,
        ),
        minLines: minLines,
        maxLines: maxLines ?? 1,
        enabled: enable,
        enableSuggestions: enableSuggestions!,
        enableInteractiveSelection: enableInteractiveSelection!,
        textAlign: textAlign!,
        textInputAction: inputAction,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

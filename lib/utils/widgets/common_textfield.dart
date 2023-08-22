// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final Color? hinttextColor;
  final Color? prefixIconColor;
  final Color? textColor;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxlines;
  final int? maxlength;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Widget? suffixicon;
  final double? radius;
  final changeObscureStatus;
  final void Function(String)? onFieldSubmitted;
  final TextStyle? labelStyle;
  final bool isUnderlineBorder;

  const CommonTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.radius,
      this.bordercolor,
      this.hinttextColor,
      this.labelText,
      this.fillcolor,
      this.maxlines,
      this.hintText,
      this.textColor,
      this.isTextHidden = false,
      this.buttonIcon,
      this.prefixIcon,
      this.prefixIconColor,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.prefixIconTap,
      this.changeObscureStatus,
      this.focus,
      this.suffixicon,
      this.onFieldSubmitted,
      this.maxlength,
      this.labelStyle,
      this.isUnderlineBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly == null ? false : true,
      onTap: onTap,
      maxLength: maxlength,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        //suffix:suffixicon,
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 11.0,
        //   horizontal: 18.0,
        // ),
        prefixIcon: prefixIcon != null
            ? GestureDetector(
                onTap: prefixIconTap,
                child: Icon(
                  prefixIcon,
                  color: prefixIconColor ?? Colors.black,
                  size: 20.0,
                ),
              )
            : null,
        suffixIcon: togglePassword!
            ? GestureDetector(
                onTap: toggleFunction,
                child: Icon(
                  toggleIcon,
                  color: const Color(0xff1A97D4),
                ),
              )
            : suffixicon,
        enabledBorder: isUnderlineBorder == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              ),
        focusedBorder: isUnderlineBorder == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              ),
        hintText: hintText,
        fillColor: fillcolor ?? Colors.transparent,
        filled: true,
        hintStyle: GoogleFonts.montserrat(
            color: hinttextColor ?? const Color(0xffA1ADB2),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        // contentPadding:
        //     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        labelText: labelText,
        labelStyle: labelStyle ??
            const TextStyle(color: Color(0xffB7BCCA), fontSize: 10.0),
        border: isUnderlineBorder == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: bordercolor ?? const Color(0xffE6F2F7),
                ),
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 30.0)),
              ),
      ),
      style: GoogleFonts.montserrat(
          color: textColor ?? const Color(0xff1A97D4),
          fontSize: 15,
          fontWeight: FontWeight.w500),
      controller: controller,
      validator: validator,
    );
  }
}

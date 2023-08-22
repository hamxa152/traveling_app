import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/text_widget.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.width = 120,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w800,
    this.backgroundColor,
    this.shadowColor,
    this.borderColor,
    this.textcolor,
    this.isIcon = false,
    this.icon,
  });

  final String title;
  final void Function() onPressed;
  final double height;
  final double width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? textcolor;
  final bool isIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.primary,
          shadowColor: const Color(0xff1A97D4).withOpacity(0.3),
          elevation: 10,
          side: BorderSide(
            color: borderColor ?? AppColor.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: isIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: AppColor.btntextcolor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyText(
                    title,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textcolor ?? AppColor.btntextcolor,
                  )
                ],
              ).marginAll(5)
            : MyText(
                title,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color:textcolor ?? AppColor.btntextcolor,
              ).marginAll(5),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/appcolors.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    this.icon,
    this.child,
    this.shadowcolor,
    this.boxColor,
    this.bordercolor = Colors.transparent,
    this.height = 45,
    this.width = 45,
    this.radius = 15,
    this.onTap
  });

  final IconData? icon;
  final Widget? child;
  final Color? shadowcolor;
  final Color? boxColor;
  final Color bordercolor;
  final double? height;
  final double? width;
  final double radius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: boxColor ?? AppColor.btntextcolor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: bordercolor,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowcolor ?? const Color(0xff1A97D4).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: child ??
            Center(
              child: Icon(
                icon!,
                color: AppColor.primary,
              ),
            ),
      ).marginOnly(top: 10),
    );
  }
}

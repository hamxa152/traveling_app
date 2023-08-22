import 'package:flutter/material.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/text_widget.dart';

class BottombarButton extends StatelessWidget {
  const BottombarButton({
    super.key,
    this.currentIndex = false,
    required this.icon,
    required this.pageTitle,
    required this.onTap,
  });

  final bool currentIndex;
  final IconData icon;
  final String pageTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: currentIndex == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: const Color(0xffA1ADB2),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                MyText(
                  pageTitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffA1ADB2),
                ),
              ],
            )
          : Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff1A97D4).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}

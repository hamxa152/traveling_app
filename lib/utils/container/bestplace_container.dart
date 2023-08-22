import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/utils/widgets/circleImage.dart';
import 'package:task/utils/widgets/text_widget.dart';

import '../appcolors.dart';

class BestPlaceContainer extends StatelessWidget {
  const BestPlaceContainer({
    super.key,
    required this.imagePath,
    required this.placename,
    required this.price,
  });

  final String imagePath;
  final String placename;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 280,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1A97D4).withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ], borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          CircularCachedNetworkImage(
            imageURL: imagePath,
            width: 200,
            height: 280,
            borderColor: AppColor.btntextcolor,
            borderWidth: 1,
            radius: 20,
          ),
          Container(
            width: 200,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff031017).withOpacity(0.3),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(
                      "4.8",
                      color: AppColor.btntextcolor,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ],
                ).marginOnly(top: 5, bottom: 5, left: 10, right: 10),
              ).marginOnly(top: 10, left: 10, right: 10),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 18,
              ).marginOnly(right: 10, top: 10)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                placename,
                color: AppColor.btntextcolor,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              RichText(
                text: TextSpan(
                  text: '\$$price ',
                  style: GoogleFonts.montserrat(
                    color: AppColor.btntextcolor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: '/ Per person',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xffFFFEFE),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ).marginOnly(left: 15, right: 15, bottom: 15)
        ],
      ),
    ).marginOnly(top: 20, bottom: 20, left: 20, right: 10);
  }
}

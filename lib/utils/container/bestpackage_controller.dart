import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/widgets/circleImage.dart';
import 'package:task/utils/widgets/text_widget.dart';

import '../appcolors.dart';

class BestPackageContainer extends StatelessWidget {
  const BestPackageContainer({
    super.key,
    required this.imagePath,
    required this.placename,
    required this.price,
    required this.package,
    required this.people,
    required this.place,
  });

  final String imagePath;
  final String placename;
  final String price;
  final String people;
  final String package;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          height: 230,
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
                height: 260,
                borderColor: AppColor.btntextcolor,
                borderWidth: 1,
                radius: 20,
              ),
              Container(
                width: 200,
                height: 260,
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: MyText(
                      '\$$price',
                      color: AppColor.btntextcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ).marginOnly(left: 10, right: 10, top: 5, bottom: 5),
                  ),
                ],
              ).marginOnly(left: 15, right: 15, bottom: 15)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MyText(
          placename,
          color: const Color(0xff031017),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 5,
        ),
        MyText(
          place,
          color: const Color(0xff5c6366),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.calendar_month,
              color: AppColor.primary,
              size: 15,
            ),
            const SizedBox(
              width: 3,
            ),
            MyText(
              package,
              color: const Color(0xff5c6366),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              width: 7,
            ),
            const Icon(
              Icons.group,
              color: AppColor.primary,
              size: 15,
            ),
            const SizedBox(
              width: 3,
            ),
            MyText(
              'People:$people',
              color: const Color(0xff5c6366),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    ).marginOnly(top: 20, bottom: 20, left: 20, right: 10);
  }
}

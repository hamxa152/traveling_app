import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/container/common_container.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/text_widget.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.subtitle,
      required this.code});

  final String imagepath;
  final String title;
  final String subtitle;
  final String code;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 370,
      height: 200,
      boxColor: Colors.white,
      radius: 20,
      child: Column(
        children: [
          Container(
            width: 370,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    imagepath,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: MyText(
              title,
              color: const Color(0xff031017),
              maxLines: 1,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: MyText(
              subtitle,
              maxLines: 1,
              color: const Color(0xff5C6366),
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: AppColor.primary,
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const MyText(
                'Code',
                color: Color(0xff5C6366),
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF2FBFF),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: MyText(
                  code,
                  color: AppColor.primary,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ).marginOnly(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.share,
                color: AppColor.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              const MyText(
                'Share',
                color: Color(0xff5C6366),
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              CommonButton(
                title: "Book Now",
                onPressed: () {},
                width: 100,
                height: 30,
                fontSize: 10,
                fontWeight: FontWeight.w300,
              )
            ],
          ).marginOnly(left: 20, right: 20),
        ],
      ),
    ).marginOnly(top: 20, bottom: 20, left: 20, right: 20);
  }
}

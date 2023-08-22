import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/dashboard/dashboard_controller.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/bottom_navbar/Icon_button.dart';
import 'package:task/utils/container/common_container.dart';
import 'package:task/utils/widgets/circleImage.dart';
import 'package:task/utils/widgets/text_widget.dart';
import 'package:task/views/dashboard/home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              color: AppColor.btntextcolor,
              child: Row(
                children: [
                  const CircularCachedNetworkImage(
                    imageURL:
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
                    height: 55,
                    width: 55,
                    borderColor: AppColor.btntextcolor,
                    borderWidth: 1,
                    radius: 40,
                  ).marginOnly(left: 20, top: 10),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: Get.width / 2.9,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          'Welcome 👋',
                          fontSize: 14,
                          color: Color(0xff5C6366),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MyText(
                          'Hamza',
                          fontSize: 20,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xff031017),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const CommonContainer(
                    icon: Icons.notifications_none_rounded,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CommonContainer(
                    icon: Icons.filter_list_outlined,
                  ).marginOnly(right: 20)
                ],
              ).marginOnly(top: 30),
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: widgetOptions.elementAt(_.currentindex),
          ),
          bottomNavigationBar: bottomnavbar(_),
        );
      },
    );
  }

  static const List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  Widget bottomnavbar(DashboardController _) {
    List<Widget> c = [];
    for (int i = 0; i < _.iconbuttonList.length; i++) {
      c.add(
        BottombarButton(
          onTap: () {
            _.currentindex = i;
            _.update();
          },
          currentIndex: _.currentindex == i ? true : false,
          icon: _.iconbuttonList[i]['icon'],
          pageTitle: _.iconbuttonList[i]['title'],
        ),
      );
    }
    return Container(
      height: 100,
      width: Get.width,
      decoration: const BoxDecoration(color: Color(0xffF2FBFF)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: c,
      ),
    );
  }
}

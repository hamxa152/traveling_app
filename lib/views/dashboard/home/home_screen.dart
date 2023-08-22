import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/dashboard/home_controller.dart';
import 'package:task/repository/apidata.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/container/bestpackage_controller.dart';
import 'package:task/utils/container/bestplace_container.dart';
import 'package:task/utils/container/common_container.dart';
import 'package:task/utils/container/offer_container.dart';
import 'package:task/utils/widgets/autocomplete/autocomplete_widget.dart';
import 'package:task/utils/widgets/autocomplete/model/prediction.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/common_dropdown.dart';
import 'package:task/utils/widgets/common_textfield.dart';
import 'package:task/utils/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              //<-------- Tabbar Container -------->
              Container(
                width: Get.width,
                height: 188,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppAssets.home,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Where’s Your',
                        style: GoogleFonts.montserrat(
                          color: AppColor.btntextcolor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '\nNext Destination?',
                            style: GoogleFonts.montserrat(
                              color: AppColor.btntextcolor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ).marginOnly(top: 20),
                    const Spacer(),
                    Container(
                      height: 60,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: customTab(_),
                    ),
                  ],
                ).marginOnly(left: 20, right: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              _.currentTab == 0
                  //<---------- Flight Tab --------->
                  ? flightsWidget(_, context)
                  : _.currentTab == 1
                      ? hotelWidget(_, context)
                      : carRentWidget(_, context),
              const SizedBox(
                height: 10,
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 1),
                child: const Row(
                  children: [
                    MyText(
                      "Limited Offers",
                      color: Color(0xff031017),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    Spacer(),
                    MyText(
                      "View All",
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ).marginOnly(left: 20, right: 20),
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 2),
                child: offerWidget(_),
              ),
              const SizedBox(
                height: 10,
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 3),
                child: const Row(
                  children: [
                    MyText(
                      "Best Places",
                      color: Color(0xff031017),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    Spacer(),
                    MyText(
                      "View All",
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ).marginOnly(left: 20, right: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 4),
                child: bestPlace(_),
              ),
              const SizedBox(
                height: 10,
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 5),
                child: const Row(
                  children: [
                    MyText(
                      "Best Packages",
                      color: Color(0xff031017),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    Spacer(),
                    MyText(
                      "View All",
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ],
                ).marginOnly(left: 20, right: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              DelayedDisplay(
                delay: Duration(seconds: _.initialDelay.inSeconds + 6),
                child: bestPackage(_),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget carRentWidget(HomeController _, BuildContext context) {
    return DelayedDisplay(
      delay: _.initialDelay,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonContainer(
                onTap: () {
                  _.journeyType.text = 'OneWay';
                  _.departure.clear();
                  _.startDate = '';
                  _.endDate = '';
                  _.update();
                },
                width: Get.width / 4.0,
                height: 37,
                boxColor: _.journeyType.text == 'OneWay'
                    ? AppColor.primary
                    : Colors.transparent,
                shadowcolor: _.journeyType.text == 'OneWay'
                    ? const Color(0xff1A97D4).withOpacity(0.3)
                    : Colors.transparent,
                radius: 50,
                bordercolor: _.journeyType.text == 'OneWay'
                    ? AppColor.primary
                    : const Color(0xffe1edf2),
                child: Center(
                  child: MyText(
                    "One Way",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: _.journeyType.text == 'OneWay'
                        ? AppColor.btntextcolor
                        : const Color(0xffA1ADB2),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CommonContainer(
                onTap: () {
                  _.journeyType.text = 'Return';
                  _.departure.clear();
                  _.startDate = '';
                  _.endDate = '';
                  _.update();
                },
                width: Get.width / 4.0,
                height: 37,
                boxColor: _.journeyType.text == 'Return'
                    ? AppColor.primary
                    : Colors.transparent,
                shadowcolor: _.journeyType.text == 'Return'
                    ? const Color(0xff1A97D4).withOpacity(0.3)
                    : Colors.transparent,
                radius: 50,
                bordercolor: _.journeyType.text == 'Return'
                    ? AppColor.primary
                    : const Color(0xffe1edf2),
                child: Center(
                  child: MyText(
                    "Round Trip",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: _.journeyType.text == 'Return'
                        ? AppColor.btntextcolor
                        : const Color(0xffA1ADB2),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              flyingwidget(
                'Pickup Location',
                _.from,
                _,
                Icons.directions_car,
                isPlaceSearch: true,
              ),
              const Spacer(),
              flyingwidget(
                'Drop-off Location',
                _.to,
                _,
                Icons.flight_land,
                isPlaceSearch: true,
              ),
            ],
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: MyText(
              _.journeyType.text == 'Return'
                  ? 'Final Destination'
                  : 'Departure',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: const Color(0xff031017),
            ).marginOnly(left: 20, right: 20),
          ),
          CommonTextField(
              controller: _.departure,
              prefixIcon: Icons.calendar_month,
              prefixIconColor: AppColor.primary,
              isUnderlineBorder: true,
              bordercolor: AppColor.primary,
              hintText: 'Select departure date',
              textColor: const Color(0xffA1ADB2),
              readOnly: true,
              onTap: () async {
                if (_.journeyType.text == 'Return') {
                  DateTimeRange? result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050, 12, 31),
                    currentDate: DateTime.now(),
                    saveText: 'Done',
                  );
                  _.departure.text =
                      '${DateFormat('yyyy-MM-dd').format(result!.start)} / ${DateFormat('yyyy-MM-dd').format(result.end)}';
                  _.startDate = DateFormat('yyyy-MM-dd').format(result.start);
                  _.endDate = DateFormat('yyyy-MM-dd').format(result.end);
                  _.update();
                } else {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  ).then(
                    (DateTime? date) {
                      if (date != null) {
                        _.departure.text =
                            DateFormat('yyyy-MM-dd').format(date);
                        _.update();
                      }
                    },
                  );
                }
              }).marginOnly(left: 10, right: 10),
          const SizedBox(
            height: 10,
          ),
          _.isViewMore == false
              ? GestureDetector(
                  onTap: () {
                    _.isViewMore = true;
                    _.update();
                  },
                  child: const Column(
                    children: [
                      MyText(
                        "View More",
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPressed: () {
                        // Get.offAllNamed(Routes.dashboardRoutes);
                      },
                      width: Get.width,
                      title: 'Search',
                      icon: Icons.search,
                      isIcon: true,
                      fontWeight: FontWeight.w500,
                    ).marginOnly(left: 10, right: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _.isViewMore = false;
                        _.update();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: AppColor.primary,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            "View Less",
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ).marginOnly(left: 10, right: 10),
        ],
      ),
    );
  }

  Widget flightsWidget(HomeController _, BuildContext context) {
    return DelayedDisplay(
      delay: _.initialDelay,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonDropDownField(
                width: Get.width / 3.0,
                height: 37,
                placeholder: "Class",
                controller: _.selectedClass,
                values: _.classList,
                checkedvalue: _.selectedClass,
                screenController: _,
              ).marginOnly(top: 12),
              const SizedBox(
                width: 5,
              ),
              CommonContainer(
                onTap: () {
                  _.journeyType.text = 'OneWay';
                  _.departure.clear();
                  _.startDate = '';
                  _.endDate = '';
                  _.update();
                },
                width: Get.width / 4.0,
                height: 37,
                boxColor: _.journeyType.text == 'OneWay'
                    ? AppColor.primary
                    : Colors.transparent,
                shadowcolor: _.journeyType.text == 'OneWay'
                    ? const Color(0xff1A97D4).withOpacity(0.3)
                    : Colors.transparent,
                radius: 50,
                bordercolor: _.journeyType.text == 'OneWay'
                    ? AppColor.primary
                    : const Color(0xffe1edf2),
                child: Center(
                  child: MyText(
                    "One Way",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: _.journeyType.text == 'OneWay'
                        ? AppColor.btntextcolor
                        : const Color(0xffA1ADB2),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              CommonContainer(
                onTap: () {
                  _.journeyType.text = 'Return';
                  _.departure.clear();
                  _.startDate = '';
                  _.endDate = '';
                  _.update();
                },
                width: Get.width / 4.0,
                height: 37,
                boxColor: _.journeyType.text == 'Return'
                    ? AppColor.primary
                    : Colors.transparent,
                shadowcolor: _.journeyType.text == 'Return'
                    ? const Color(0xff1A97D4).withOpacity(0.3)
                    : Colors.transparent,
                radius: 50,
                bordercolor: _.journeyType.text == 'Return'
                    ? AppColor.primary
                    : const Color(0xffe1edf2),
                child: Center(
                  child: MyText(
                    "Round Trip",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: _.journeyType.text == 'Return'
                        ? AppColor.btntextcolor
                        : const Color(0xffA1ADB2),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              flyingwidget('Flying Form', _.from, _, Icons.flight_takeoff),
              const Spacer(),
              flyingwidget('Flying To', _.to, _, Icons.flight_land),
            ],
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 10,
          ),
          CommonTextField(
              controller: _.departure,
              prefixIcon: Icons.calendar_month,
              prefixIconColor: AppColor.primary,
              isUnderlineBorder: true,
              bordercolor: AppColor.primary,
              hintText: 'Select departure date',
              textColor: const Color(0xffA1ADB2),
              readOnly: true,
              onTap: () async {
                if (_.journeyType.text == 'Return') {
                  DateTimeRange? result = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050, 12, 31),
                    currentDate: DateTime.now(),
                    saveText: 'Done',
                  );
                  _.departure.text =
                      '${DateFormat('yyyy-MM-dd').format(result!.start)} / ${DateFormat('yyyy-MM-dd').format(result.end)}';
                  _.startDate = DateFormat('yyyy-MM-dd').format(result.start);
                  _.endDate = DateFormat('yyyy-MM-dd').format(result.end);
                  _.update();
                } else {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  ).then(
                    (DateTime? date) {
                      if (date != null) {
                        _.departure.text =
                            DateFormat('yyyy-MM-dd').format(date);
                        _.update();
                      }
                    },
                  );
                }
              }).marginOnly(left: 10, right: 10),
          const SizedBox(
            height: 10,
          ),
          _.isViewMore == false
              ? GestureDetector(
                  onTap: () {
                    _.isViewMore = true;
                    _.update();
                  },
                  child: const Column(
                    children: [
                      MyText(
                        "View More",
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: MyText(
                        'Travelers',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff031017),
                      ),
                    ).marginOnly(left: 10, right: 10),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 2.2,
                          child: CommonTextField(
                            controller: _.adults,
                            prefixIcon: Icons.group,
                            prefixIconColor: AppColor.primary,
                            isUnderlineBorder: true,
                            bordercolor: AppColor.primary,
                            keyboardType: TextInputType.number,
                            hintText: 'Adults',
                            textColor: const Color(0xffA1ADB2),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: Get.width / 2.2,
                          child: CommonTextField(
                            controller: _.childs,
                            prefixIcon: Icons.group,
                            prefixIconColor: AppColor.primary,
                            isUnderlineBorder: true,
                            bordercolor: AppColor.primary,
                            hintText: 'Childs',
                            keyboardType: TextInputType.number,
                            textColor: const Color(0xffA1ADB2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPressed: () {
                        if (_.adults.text.isEmpty) {
                          _.adults.text = '1';
                          _.update();
                        } else if (_.childs.text.isEmpty) {
                          _.childs.text = '0';
                          _.update();
                        }
                        Get.toNamed(
                          Routes.flightbookingRoutes,
                          arguments: {
                            "journeyType": _.journeyType.text,
                            "selectedClass": _.selectedClass.text,
                            "from": _.from.text,
                            "to": _.to.text.isEmpty ? '' : _.to.text,
                            "from_date": _.startDate.isEmpty
                                ? _.departure.text
                                : _.startDate,
                            "to_date": _.endDate.isEmpty ? '' : _.endDate,
                            "adults":
                                _.adults.text.isEmpty ? '1' : _.adults.text,
                            "childs":
                                _.childs.text.isEmpty ? '0' : _.childs.text,
                          },
                        );
                      },
                      width: Get.width,
                      title: 'Search',
                      icon: Icons.search,
                      isIcon: true,
                      fontWeight: FontWeight.w500,
                    ).marginOnly(left: 10, right: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _.isViewMore = false;
                        _.update();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: AppColor.primary,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            "View Less",
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ).marginOnly(left: 10, right: 10),
        ],
      ),
    );
  }

  Widget hotelWidget(HomeController _, BuildContext context) {
    return DelayedDisplay(
      delay: _.initialDelay,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const MyText(
            'Where Are You Going?',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff031017),
          ).marginOnly(left: 20, right: 20),
          GooglePlaceAutoCompleteTextField(
            textEditingController: _.place,
            isPlaceSearch: true,
            googleAPIKey: ApiData.mapKey,
            textStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xffA1ADB2),
            ),
            inputDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search for place and property',
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xffA1ADB2),
              ),
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: AppColor.primary,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD8D8D8),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColor.primary,
                ),
              ),
            ),
            debounceTime: 800,
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) {},
            itmClick: (Prediction prediction) {
              _.place.text = prediction.description!;
              _.update();
            },
          ).marginOnly(left: 20, right: 20),
          const SizedBox(
            height: 10,
          ),
          const MyText(
            'Check in - Check out',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff031017),
          ).marginOnly(left: 20, right: 20),
          CommonTextField(
              controller: _.departure,
              prefixIcon: Icons.calendar_month,
              prefixIconColor: AppColor.primary,
              isUnderlineBorder: true,
              bordercolor: AppColor.primary,
              hintText: 'Select departure date',
              textColor: const Color(0xffA1ADB2),
              readOnly: true,
              onTap: () async {
                DateTimeRange? result = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050, 12, 31),
                  currentDate: DateTime.now(),
                  saveText: 'Done',
                );
                _.departure.text =
                    '${DateFormat('yyyy-MM-dd').format(result!.start)} / ${DateFormat('yyyy-MM-dd').format(result.end)}';
                _.startDate = DateFormat('yyyy-MM-dd').format(result.start);
                _.endDate = DateFormat('yyyy-MM-dd').format(result.end);
                _.update();
              }).marginOnly(left: 10, right: 10),
          const SizedBox(
            height: 10,
          ),
          _.isViewMore == false
              ? Center(
                  child: GestureDetector(
                    onTap: () {
                      _.isViewMore = true;
                      _.update();
                    },
                    child: const Column(
                      children: [
                        MyText(
                          "View More",
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColor.primary,
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: MyText(
                        'Travelers',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xff031017),
                      ),
                    ).marginOnly(left: 10, right: 10),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 2.2,
                          child: CommonTextField(
                            controller: _.adults,
                            prefixIcon: Icons.group,
                            prefixIconColor: AppColor.primary,
                            isUnderlineBorder: true,
                            bordercolor: AppColor.primary,
                            keyboardType: TextInputType.number,
                            hintText: 'Adults',
                            textColor: const Color(0xffA1ADB2),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: Get.width / 2.2,
                          child: CommonTextField(
                            controller: _.childs,
                            prefixIcon: Icons.group,
                            prefixIconColor: AppColor.primary,
                            isUnderlineBorder: true,
                            bordercolor: AppColor.primary,
                            hintText: 'Childs',
                            keyboardType: TextInputType.number,
                            textColor: const Color(0xffA1ADB2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      onPressed: () {
                        // Get.offAllNamed(Routes.dashboardRoutes);
                      },
                      width: Get.width,
                      title: 'Search',
                      icon: Icons.search,
                      isIcon: true,
                      fontWeight: FontWeight.w500,
                    ).marginOnly(left: 10, right: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _.isViewMore = false;
                        _.update();
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: AppColor.primary,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          MyText(
                            "View Less",
                            color: AppColor.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ).marginOnly(left: 10, right: 10),
        ],
      ),
    );
  }

  Widget bestPackage(HomeController _) {
    return SizedBox(
      width: Get.width,
      height: 340,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: _.bestPackageList.length,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (c, i) {
          return BestPackageContainer(
            imagePath: _.bestPackageList[i]['imagepath'],
            placename: _.bestPackageList[i]['name'],
            price: _.bestPackageList[i]['price'],
            package: _.bestPackageList[i]['package'],
            people: _.bestPackageList[i]['people'].toString(),
            place: _.bestPackageList[i]['place'],
          );
        },
      ),
    );
  }

  Widget bestPlace(HomeController _) {
    return SizedBox(
      width: Get.width,
      height: 310,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: _.bestPlacesList.length,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (c, i) {
          return BestPlaceContainer(
            imagePath: _.bestPlacesList[i]['imagepath'],
            placename: _.bestPlacesList[i]['name'],
            price: _.bestPlacesList[i]['price'],
          );
        },
      ),
    );
  }

  Widget flyingwidget(String title, TextEditingController flying,
      HomeController _, IconData icon,
      {bool isPlaceSearch = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: const Color(0xff031017),
        ),
        const SizedBox(
          height: 0,
        ),
        SizedBox(
          width: Get.width / 2.3,
          child: GooglePlaceAutoCompleteTextField(
            textEditingController: flying,
            isPlaceSearch: isPlaceSearch,
            googleAPIKey: ApiData.mapKey,
            textStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xffA1ADB2),
            ),
            inputDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Airport',
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xffA1ADB2),
              ),
              prefixIcon: Icon(
                icon,
                color: AppColor.primary,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD8D8D8),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColor.primary,
                ),
              ),
            ),
            debounceTime: 800,
            isLatLngRequired: true,
            getPlaceDetailWithLatLng: (Prediction prediction) async {
              flying.text = await _.getCountryCode(
                  double.parse(prediction.lat.toString()),
                  double.parse(prediction.lng.toString()));
              _.update();
            },
            itmClick: (Prediction prediction) {},
          ),
        ),
      ],
    );
  }

  Widget offerWidget(HomeController _) {
    return SizedBox(
      width: Get.width,
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _.offersList.length,
        separatorBuilder: (c, i) {
          return const SizedBox(
            width: 0,
          );
        },
        itemBuilder: (c, i) {
          return OfferContainer(
            imagepath: _.offersList[i]['imagepath'],
            title: _.offersList[i]['title'],
            subtitle: _.offersList[i]['subtitle'],
            code: _.offersList[i]['code'],
          );
        },
      ),
    );
  }

  Widget customTab(HomeController _) {
    List<Widget> c = [];
    for (int i = 0; i < _.tablist.length; i++) {
      c.add(
        GestureDetector(
          onTap: () {
            _.currentTab = i;
            _.update();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color:
                      _.currentTab == i ? AppColor.primary : Colors.transparent,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _.tablist[i]['icon'],
                  color: _.currentTab == i
                      ? AppColor.primary
                      : const Color(0xffA1ADB2),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyText(
                  _.tablist[i]['name'],
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: _.currentTab == i
                      ? const Color(0xff031017)
                      : const Color(0xffA1ADB2),
                ),
              ],
            ).marginOnly(
                bottom: 10, left: i == 0 ? 10 : 0, right: i == 2 ? 10 : 0),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: c,
    );
  }
}

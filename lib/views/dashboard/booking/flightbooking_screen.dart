import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/controllers/dashboard/flightbooking_controller.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/circleImage.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/common_dropdown.dart';
import 'package:task/utils/widgets/text_widget.dart';

class FlightBooking extends StatelessWidget {
  const FlightBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightBookingController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  const Color.fromARGB(255, 224, 242, 195).withOpacity(0.2),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 190,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.home),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            MyText(
                              _.from,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: AppColor.btntextcolor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.compare_arrows_sharp,
                              color: AppColor.btntextcolor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyText(
                              _.to,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: AppColor.btntextcolor,
                            ),
                            const Spacer(),
                            MaterialButton(
                              onPressed: () {
                                Get.back();
                              },
                              minWidth: 40,
                              height: 40,
                              color: AppColor.primary,
                              textColor: Colors.white,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.edit,
                                size: 15,
                              ),
                            )
                          ],
                        ).marginOnly(left: 10, right: 10),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              "${_.returnDateFormat(_.fromdate)} ",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.btntextcolor,
                            ),
                            _.todate.isNotEmpty
                                ? MyText(
                                    '- ${_.returnDateFormat(_.todate)}',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.btntextcolor,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.group,
                              color: AppColor.btntextcolor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyText(
                              "${_.adults} Adults, ",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.btntextcolor,
                            ),
                            MyText(
                              ' ${_.childs}  Children',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.btntextcolor,
                            ),
                          ],
                        ),
                      ],
                    ).marginOnly(bottom: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _.isLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${_.filghtBookingList.length} Flights  ',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xff031017),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Available',
                                        style: GoogleFonts.montserrat(
                                          color: const Color(0xff031017),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {},
                                  minWidth: 40,
                                  height: 40,
                                  color: AppColor.primary,
                                  textColor: Colors.white,
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.filter_list_sharp,
                                    size: 15,
                                  ),
                                )
                              ],
                            ).marginOnly(left: 20, right: 20),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CommonDropDownField(
                                  width: Get.width / 3.0,
                                  height: 37,
                                  placeholder: "Price",
                                  controller: _.selectPrice,
                                  values: _.price,
                                  checkedvalue: _.selectPrice,
                                  screenController: _,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CommonDropDownField(
                                  width: Get.width / 3.0,
                                  height: 37,
                                  placeholder: "Include",
                                  controller: _.selectInclude,
                                  values: _.include,
                                  checkedvalue: _.selectInclude,
                                  screenController: _,
                                ),
                              ],
                            ).marginOnly(left: 20, right: 20),
                            const SizedBox(
                              height: 20,
                            ),
                            _.filghtBookingList.isEmpty
                                ? const Center(
                                    child: MyText("Sorry no Data found"),
                                  )
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: _.filghtBookingList.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 20,
                                    ),
                                    itemBuilder: (c, i) {
                                      return Container(
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                const CircularCachedNetworkImage(
                                                  imageURL: '',
                                                  height: 55,
                                                  width: 55,
                                                  borderColor:
                                                      AppColor.btntextcolor,
                                                  borderWidth: 1,
                                                  radius: 40,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                SizedBox(
                                                  width: Get.width / 3.0,
                                                  child: MyText(
                                                    "${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![0].airlineName}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        const Color(0xff031017),
                                                  ),
                                                ),
                                                const Spacer(),
                                                MyText(
                                                  "\$${_.filghtBookingList[i].fareTotal!.total!.amount}",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColor.primary,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                MyText(
                                                  "${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![0].departureAirportCode}",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff031017),
                                                ),
                                                const Spacer(),
                                                MyText(
                                                  "${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![0].arrivalAirportCode}",
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff031017),
                                                ),
                                              ],
                                            ).marginOnly(left: 10, right: 10),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.stop_circle_outlined,
                                                  size: 15,
                                                  color: AppColor.primary,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: AppColor.primary,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.flight,
                                                  size: 15,
                                                  color: AppColor.primary,
                                                ),
                                                Flexible(
                                                  child: Container(
                                                    height: 1,
                                                    color: AppColor.primary,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.stop_circle_outlined,
                                                  size: 15,
                                                  color: AppColor.primary,
                                                ),
                                              ],
                                            ).marginOnly(left: 10, right: 10),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                MyText(
                                                  _.returnWeekDaysFormat(_
                                                      .filghtBookingList[i]
                                                      .originDestinationOptions![
                                                          0]
                                                      .tourSegments![0]
                                                      .departureDateTime!),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff031017),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.watch_later_outlined,
                                                  size: 15,
                                                  color: AppColor.primary,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                MyText(
                                                  _.durationToString(int.parse(_
                                                      .filghtBookingList[i]
                                                      .originDestinationOptions![
                                                          0]
                                                      .tourSegments![0]
                                                      .journeyDuration!)),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff031017),
                                                ),
                                                const Spacer(),
                                                MyText(
                                                  _.returnWeekDaysFormat(_
                                                      .filghtBookingList[i]
                                                      .originDestinationOptions![
                                                          0]
                                                      .tourSegments![0]
                                                      .arrivalDateTime!),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff031017),
                                                ),
                                              ],
                                            ).marginOnly(left: 10, right: 10),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            _.filghtBookingList[i].isExpand
                                                ? const SizedBox()
                                                : Row(
                                                    children: [
                                                      Container(
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffF2FBFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xffE1EDF2,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: MyText(
                                                            _.selectedClass,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xff031017),
                                                          ).marginOnly(
                                                              left: 10,
                                                              right: 10),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffF2FBFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xffE1EDF2,
                                                            ),
                                                          ),
                                                        ),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .shopping_bag_outlined,
                                                              color: AppColor
                                                                  .primary,
                                                              size: 15,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            MyText(
                                                              '1 x 20 kg',
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff031017),
                                                            ),
                                                          ],
                                                        ).marginOnly(
                                                            left: 5, right: 10),
                                                      ),
                                                      const Spacer(),
                                                      _.journeyType == 'OneWay'
                                                          ? CommonButton(
                                                              onPressed: () {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .bookingRoutes,
                                                                  arguments: {
                                                                    "adults": _
                                                                        .adults,
                                                                    "child": _
                                                                        .childs,
                                                                  },
                                                                );
                                                              },
                                                              height: 35,
                                                              width:
                                                                  Get.width / 3,
                                                              title:
                                                                  'Select Flight',
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )
                                                          : GestureDetector(
                                                              onTap: () {
                                                                _.filghtBookingList[i]
                                                                    .isExpand = true;
                                                                _.update();
                                                              },
                                                              child:
                                                                  const MyText(
                                                                'Show Details ',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: AppColor
                                                                    .primary,
                                                              ),
                                                            ),
                                                      _.journeyType == 'OneWay'
                                                          ? const SizedBox()
                                                          : GestureDetector(
                                                              onTap: () {
                                                                _.filghtBookingList[i]
                                                                    .isExpand = true;
                                                                _.update();
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_sharp,
                                                                color: AppColor
                                                                    .primary,
                                                                size: 15,
                                                              ),
                                                            ),
                                                    ],
                                                  ).marginOnly(
                                                    left: 10, right: 10),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            _.filghtBookingList[i].isExpand
                                                ? DelayedDisplay(
                                                    delay: _.initialDelay,
                                                    child: bottomPart(
                                                      _,
                                                      departureDateTime: _
                                                              .filghtBookingList[
                                                                  i]
                                                              .isRound
                                                          ? _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![0]
                                                              .departureDateTime!
                                                          : _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![1]
                                                              .departureDateTime!,
                                                      airlineName: _
                                                              .filghtBookingList[
                                                                  i]
                                                              .isRound
                                                          ? _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![0]
                                                              .airlineName
                                                          : _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![1]
                                                              .airlineName,
                                                      departureAirportCode: _
                                                              .filghtBookingList[
                                                                  i]
                                                              .isRound
                                                          ? _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![0]
                                                              .departureAirportCode
                                                          : _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![1]
                                                              .departureAirportCode,
                                                      arrivalDateTime: _
                                                              .filghtBookingList[
                                                                  i]
                                                              .isRound
                                                          ? _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![0]
                                                              .arrivalDateTime!
                                                          : _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![1]
                                                              .arrivalDateTime!,
                                                      arrivalAirportCode: _
                                                              .filghtBookingList[
                                                                  i]
                                                              .isRound
                                                          ? _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![0]
                                                              .arrivalAirportCode
                                                          : _
                                                              .filghtBookingList[
                                                                  i]
                                                              .originDestinationOptions![
                                                                  0]
                                                              .tourSegments![1]
                                                              .arrivalAirportCode,
                                                      isExpand: _
                                                          .filghtBookingList[i]
                                                          .isExpand,
                                                      firstRow: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              _.filghtBookingList[i]
                                                                  .isRound = true;
                                                              _.update();
                                                            },
                                                            child: SizedBox(
                                                              width: Get.width /
                                                                  2.5,
                                                              child: Column(
                                                                children: [
                                                                  MyText(
                                                                    "(${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![0].departureAirportCode}) - (${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![0].arrivalAirportCode})",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .primary,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Divider(
                                                                    color: _
                                                                            .filghtBookingList[
                                                                                i]
                                                                            .isRound
                                                                        ? AppColor
                                                                            .primary
                                                                        : Colors
                                                                            .transparent,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _.filghtBookingList[i]
                                                                  .isRound = false;
                                                              _.update();
                                                            },
                                                            child: SizedBox(
                                                              width: Get.width /
                                                                  2.5,
                                                              child: Column(
                                                                children: [
                                                                  MyText(
                                                                    "(${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![1].departureAirportCode}) - (${_.filghtBookingList[i].originDestinationOptions![0].tourSegments![1].arrivalAirportCode})",
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .primary,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Divider(
                                                                    color: _.filghtBookingList[i].isRound ==
                                                                            false
                                                                        ? AppColor
                                                                            .primary
                                                                        : Colors
                                                                            .transparent,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      lastRow: Row(
                                                        children: [
                                                          CommonButton(
                                                            onPressed: () {
                                                              Get.toNamed(
                                                                Routes
                                                                    .bookingRoutes,
                                                                arguments: {
                                                                  "adults":
                                                                      _.adults,
                                                                  "child":
                                                                      _.childs,
                                                                },
                                                              );
                                                            },
                                                            height: 35,
                                                            width:
                                                                Get.width / 3,
                                                            title:
                                                                'Select Flight',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _.filghtBookingList[i]
                                                                  .isExpand = false;
                                                              _.update();
                                                            },
                                                            child: const MyText(
                                                              'Hide Details ',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .primary,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              _.filghtBookingList[i]
                                                                  .isExpand = false;
                                                              _.update();
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_up,
                                                              color: AppColor
                                                                  .primary,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ).marginOnly(left: 10, right: 10),
                                      );
                                    },
                                  ).marginOnly(left: 20, right: 20)
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomPart(
    FlightBookingController _, {
    DateTime? departureDateTime,
    String? airlineName,
    String? departureAirportCode,
    DateTime? arrivalDateTime,
    String? arrivalAirportCode,
    bool? isExpand,
    Widget? lastRow,
    Widget? firstRow,
  }) {
    return Column(
      children: [
        firstRow!,
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Icon(
              Icons.date_range,
              color: AppColor.primary,
            ),
            const SizedBox(
              width: 10,
            ),
            MyText(
              _.returnDateFormat(departureDateTime.toString()),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xff031017),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: MyText(
            _.returnDay(departureDateTime.toString()),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xff031017).withOpacity(0.3),
          ),
        ).marginOnly(left: 30),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const CircularCachedNetworkImage(
              imageURL: '',
              height: 55,
              width: 55,
              borderColor: AppColor.btntextcolor,
              borderWidth: 1,
              radius: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: _.returnWeekDaysFormat(departureDateTime!),
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff031017),
                    ),
                    children: [
                      TextSpan(
                        text: ' $departureAirportCode',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff031017).withOpacity(0.3),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.stop_circle_outlined,
                            size: 15,
                            color: AppColor.primary,
                          ),
                          Expanded(
                            child: VerticalDivider(color: AppColor.primary),
                          ),
                          Icon(
                            Icons.flight,
                            size: 15,
                            color: AppColor.primary,
                          ),
                          Expanded(
                            child: VerticalDivider(color: AppColor.primary),
                          ),
                          Icon(
                            Icons.stop_circle_outlined,
                            size: 15,
                            color: AppColor.primary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MyText(
                      airlineName!,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff031017),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: _.returnWeekDaysFormat(arrivalDateTime!),
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff031017),
                    ),
                    children: [
                      TextSpan(
                        text: ' $arrivalAirportCode',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff031017).withOpacity(0.3),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xffF2FBFF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(
                    0xffE1EDF2,
                  ),
                ),
              ),
              child: Center(
                child: MyText(
                  _.selectedClass,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff031017),
                ).marginOnly(left: 10, right: 10),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xffF2FBFF),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(
                    0xffE1EDF2,
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColor.primary,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MyText(
                    '1 x 20 kg',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff031017),
                  ),
                ],
              ).marginOnly(left: 10, right: 10),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: AppColor.primary,
        ),
        const SizedBox(
          height: 10,
        ),
        lastRow!,
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

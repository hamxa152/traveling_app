import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task/controllers/dashboard/booking_controller.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/circleImage.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/common_dropdown.dart';
import 'package:task/utils/widgets/common_textfield.dart';
import 'package:task/utils/widgets/text_widget.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
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
              child: Form(
                key: _.formkey,
                child: Column(
                  children: [
                    Container(
                      height: 150,
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
                              const MyText(
                                "Your Flight Booking",
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: AppColor.btntextcolor,
                              ),
                              const Spacer(),
                              const CircularCachedNetworkImage(
                                imageURL:
                                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60',
                                height: 55,
                                width: 55,
                                borderColor: AppColor.btntextcolor,
                                borderWidth: 1,
                                radius: 40,
                              ).marginOnly(left: 20, top: 10),
                            ],
                          ).marginOnly(left: 10, right: 10),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ).marginOnly(bottom: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _.adultsFormList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                      itemBuilder: (c, i) {
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: MyText(
                                  "Traveler ${i + 1}: Adult",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff031017),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Color(0xffE1EDF2),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'First Name *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        CommonTextField(
                                          bordercolor: const Color(0xffE1EDF2),
                                          controller: _.adultsFormList[i]
                                              ['first_name'],
                                          isUnderlineBorder: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Last Name *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        CommonTextField(
                                          controller: _.adultsFormList[i]
                                              ['last_name'],
                                          bordercolor: const Color(0xffE1EDF2),
                                          isUnderlineBorder: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Gender *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CommonDropDownField(
                                          height: 37,
                                          placeholder: "Gender",
                                          controller: _.adultsFormList[i]
                                              ['gender'],
                                          values: _.genderList,
                                          checkedvalue: _.adultsFormList[i]
                                              ['gender'],
                                          screenController: _,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Date Of Birth *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CommonTextField(
                                          controller: _.adultsFormList[i]
                                              ['dateofbirth'],
                                          isUnderlineBorder: true,
                                          readOnly: true,
                                          bordercolor: const Color(0xffE1EDF2),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2030),
                                              builder: (BuildContext context,
                                                  Widget? child) {
                                                return Theme(
                                                  data: ThemeData.dark(),
                                                  child: child!,
                                                );
                                              },
                                            ).then(
                                              (DateTime? date) {
                                                if (date != null) {
                                                  _
                                                          .adultsFormList[i]
                                                              ['dateofbirth']
                                                          .text =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(date);
                                                  _.update();
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Nationality',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.adultsFormList[i]['nationality'],
                                isUnderlineBorder: true,
                                bordercolor: const Color(0xffE1EDF2),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Mobile',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.adultsFormList[i]['mobile'],
                                isUnderlineBorder: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Email',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.adultsFormList[i]['email'],
                                isUnderlineBorder: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const MyText(
                                'Booking confirmation will be sent to this email address.',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffa1adb2),
                              ).marginOnly(left: 10),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Passport Details',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.primary,
                              ).marginOnly(left: 10),
                              const SizedBox(
                                height: 10,
                              ),
                              const MyText(
                                'Passport Number',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.adultsFormList[i]['passportNo'],
                                keyboardType: TextInputType.number,
                                bordercolor: const Color(0xffE1EDF2),
                                isUnderlineBorder: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ).marginOnly(left: 10, right: 10),
                        );
                      },
                    ).marginOnly(left: 20, right: 20),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _.childFormList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                      itemBuilder: (c, i) {
                        return Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: MyText(
                                  "Traveler ${_.adultsFormList.length + i + 1}: Child",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff031017),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Color(0xffE1EDF2),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'First Name *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        CommonTextField(
                                          controller: _.childFormList[i]
                                              ['first_name'],
                                          bordercolor: const Color(0xffE1EDF2),
                                          isUnderlineBorder: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Last Name *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        CommonTextField(
                                          controller: _.childFormList[i]
                                              ['last_name'],
                                          bordercolor: const Color(0xffE1EDF2),
                                          isUnderlineBorder: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Gender *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CommonDropDownField(
                                          height: 37,
                                          placeholder: "Gender",
                                          controller: _.childFormList[i]
                                              ['gender'],
                                          values: _.genderList,
                                          checkedvalue: _.childFormList[i]
                                              ['gender'],
                                          screenController: _,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          'Date Of Birth *',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Color(0xff031017),
                                        ).marginOnly(left: 10),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CommonTextField(
                                          controller: _.childFormList[i]
                                              ['dateofbirth'],
                                          bordercolor: const Color(0xffE1EDF2),
                                          isUnderlineBorder: true,
                                          readOnly: true,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Enter value";
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2030),
                                              builder: (BuildContext context,
                                                  Widget? child) {
                                                return Theme(
                                                  data: ThemeData.dark(),
                                                  child: child!,
                                                );
                                              },
                                            ).then(
                                              (DateTime? date) {
                                                if (date != null) {
                                                  _
                                                          .childFormList[i]
                                                              ['dateofbirth']
                                                          .text =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(date);
                                                  _.update();
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Nationality',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.childFormList[i]['nationality'],
                                isUnderlineBorder: true,
                                bordercolor: const Color(0xffE1EDF2),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Mobile',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.childFormList[i]['mobile'],
                                isUnderlineBorder: true,
                                bordercolor: const Color(0xffE1EDF2),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Email',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.childFormList[i]['email'],
                                isUnderlineBorder: true,
                                bordercolor: const Color(0xffE1EDF2),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const MyText(
                                'Booking confirmation will be sent to this email address.',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xffa1adb2),
                              ).marginOnly(left: 10),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Passport Details',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.primary,
                              ).marginOnly(left: 10),
                              const SizedBox(
                                height: 10,
                              ),
                              const MyText(
                                'Passport Number',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff031017),
                              ).marginOnly(left: 10),
                              CommonTextField(
                                controller: _.childFormList[i]['passportNo'],
                                keyboardType: TextInputType.number,
                                bordercolor: const Color(0xffE1EDF2),
                                isUnderlineBorder: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter value";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ).marginOnly(left: 10, right: 10),
                        );
                      },
                    ).marginOnly(left: 20, right: 20),
                    Row(
                      children: [
                        CommonButton(
                          onPressed: () {
                            Get.back();
                          },
                          backgroundColor: Colors.white,
                          shadowColor: Colors.transparent,
                          borderColor: AppColor.primary,
                          height: 35,
                          width: Get.width / 3,
                          title: 'Back',
                          fontSize: 13,
                          textcolor: AppColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CommonButton(
                          onPressed: () {
                            if (_.validateAndSaveUser()) {
                              _.setListData();
                            }
                          },
                          height: 35,
                          width: Get.width / 3,
                          title: 'Next',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ).marginOnly(left: 20, right: 20),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

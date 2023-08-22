import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:task/controllers/auth/pinscreen_controller.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/snackbar.dart';
import 'package:task/utils/widgets/text_widget.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinScreenController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: _.isLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                                width: Get.width,
                                // height: Get.height / 1.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      AppAssets.pincode,
                                      width: Get.width / 2,
                                    ),
                                    Image.asset(
                                      AppAssets.pincode,
                                      width: Get.width / 2,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const MyText(
                                      'Verify Code',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primary,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const MyText(
                                      'We sent an OTP code on your Email.',
                                      fontSize: 18,
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.ligthTextColor,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PinCodeTextField(
                                      autofocus: true,
                                      controller: _.code,
                                      hideCharacter: false,
                                      highlight: false,
                                      // hideDefaultKeyboard: true,
                                      highlightColor: const Color(0xffE1EDF2),
                                      defaultBorderColor:
                                          const Color(0xffE1EDF2),
                                      hasTextBorderColor:
                                          const Color(0xffE1EDF2),
                                      highlightPinBoxColor: Colors.transparent,
                                      maxLength: 6,
                                      pinBoxWidth: 35,
                                      pinBoxHeight: 35,
                                      hasUnderline: false,
                                      wrapAlignment: WrapAlignment.spaceAround,
                                      pinBoxDecoration: ProvidedPinBoxDecoration
                                          .defaultPinBoxDecoration,
                                      pinTextStyle: GoogleFonts.montserrat(
                                          color: const Color(0xff1A97D4),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      pinTextAnimatedSwitcherTransition:
                                          ProvidedPinBoxTextAnimation
                                              .scalingTransition,
                                      pinTextAnimatedSwitcherDuration:
                                          const Duration(milliseconds: 300),
                                      highlightAnimationBeginColor:
                                          Colors.black,
                                      highlightAnimationEndColor:
                                          Colors.white12,
                                      keyboardType: TextInputType.number,
                                    ).paddingOnly(left: 20, right: 20),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CommonButton(
                                      onPressed: () async {
                                        if (_.code.text.length < 6) {
                                          CommonSnackbar.getSnackbar(
                                              "Info",
                                              "Please enter correct code",
                                              Colors.blue);
                                        } else {
                                          await _.verifyAccount();
                                        }
                                      },
                                      width: 150,
                                      title: 'Validate',
                                    ),
                                  ],
                                ).marginOnly(
                                    left: 15, right: 15, top: 20, bottom: 20))
                            .marginOnly(
                                left: 20, right: 20, top: 20, bottom: 20),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task/controllers/auth/register_controller.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/checkboxwithtitle.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/common_textfield.dart';
import 'package:task/utils/widgets/text_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
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
                          child: Form(
                            key: _.formkey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const MyText(
                                  'Register for New User',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: MyText(
                                    "Full Name *",
                                    color: AppColor.textColorsBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonTextField(
                                  controller: _.name,
                                  hintText: 'full name',
                                  keyboardType: TextInputType.emailAddress,
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
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: MyText(
                                    "Phone Number *",
                                    color: AppColor.textColorsBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                IntlPhoneField(
                                  controller: _.phonenumber,
                                  flagsButtonPadding: const EdgeInsets.all(8),
                                  dropdownIconPosition: IconPosition.trailing,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE6F2F7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE6F2F7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE6F2F7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    hintStyle: GoogleFonts.montserrat(
                                        color: const Color(0xffA1ADB2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xff1A97D4),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  initialCountryCode: '',
                                  onChanged: (phone) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: MyText(
                                    "Email *",
                                    color: AppColor.textColorsBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonTextField(
                                  controller: _.email,
                                  hintText: 'example@gmail.com',
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
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: MyText(
                                    "Password *",
                                    color: AppColor.textColorsBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonTextField(
                                  controller: _.password,
                                  hintText: '**************',
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter value";
                                    }
                                    return null;
                                  },
                                  togglePassword: true,
                                  isTextHidden: _.isPasswordShown,
                                  maxlines: 1,
                                  toggleIcon: _.isPasswordShown == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                                  toggleFunction: () {
                                    _.isPasswordShown = !_.isPasswordShown;
                                    _.update();
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: MyText(
                                    "Confirm Password *",
                                    color: AppColor.textColorsBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonTextField(
                                  controller: _.confirmpassword,
                                  hintText: '**************',
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter value";
                                    } else if (_.password.text !=
                                        _.confirmpassword.text) {
                                      return 'please does not match';
                                    }
                                    return null;
                                  },
                                  togglePassword: true,
                                  isTextHidden: _.isPasswordShown1,
                                  maxlines: 1,
                                  toggleIcon: _.isPasswordShown1 == true
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                                  toggleFunction: () {
                                    _.isPasswordShown1 = !_.isPasswordShown1;
                                    _.update();
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: LabeledCheckbox(
                                    contentPadding: EdgeInsets.zero,
                                    activeColor: AppColor.primary,
                                    label:
                                        'I Agree To The Terms Of Service And Privacy Policy',
                                    value: _.isRemeber,
                                    onTap: (v) {
                                      _.isRemeber = v!;
                                      _.update();
                                    },
                                    gap: 5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CommonButton(
                                  onPressed: () async {
                                    if (_.validateAndSaveUser()) {
                                      await _.registerAccount();
                                    }
                                    // _.isPinCodeScreen = true;
                                    // _.update();
                                  },
                                  width: 150,
                                  title: 'Register',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Already have an account? ',
                                      style: GoogleFonts.montserrat(
                                        color: const Color(0xffA1ADB2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Log In',
                                          style: GoogleFonts.montserrat(
                                            color: AppColor.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ).marginOnly(
                                left: 15, right: 15, top: 20, bottom: 20),
                          ),
                        ).marginOnly(left: 20, right: 20, top: 20, bottom: 20),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

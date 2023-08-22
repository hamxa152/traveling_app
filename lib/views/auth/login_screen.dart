import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/controllers/auth/login_controller.dart';
import 'package:task/routes/app_routes.dart';
import 'package:task/utils/appassets.dart';
import 'package:task/utils/appcolors.dart';
import 'package:task/utils/widgets/checkboxwithtitle.dart';
import 'package:task/utils/widgets/common_button.dart';
import 'package:task/utils/widgets/common_textfield.dart';
import 'package:task/utils/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                              Container(
                                height: 54,
                                width: 54,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffE1EDF2)),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const MyText(
                                'Login to Existing User',
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
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  var regex = RegExp(pattern as String);
                                  return (!regex.hasMatch(value))
                                      ? 'Please enter valid email'
                                      : null;
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
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LabeledCheckbox(
                                    contentPadding: EdgeInsets.zero,
                                    activeColor: AppColor.primary,
                                    label: 'Remember Login Info',
                                    value: _.isRemeber,
                                    onTap: (v) {
                                      _.isRemeber = v!;
                                      _.update();
                                    },
                                    gap: 0,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: MyText(
                                  'Forgot Password?',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColor.primary,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CommonButton(
                                onPressed: () async {
                                  if (_.validateAndSaveUser()) {
                                    await _.login();
                                  }
                                },
                                title: 'Login',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.registerRoutes);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Don’t have an account? ',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xffA1ADB2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Create account',
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
                      ).marginOnly(left: 20, right: 20),
                    ),
            ),
          ),
        );
      },
    );
  }
}

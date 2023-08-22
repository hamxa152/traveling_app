import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/utils/widgets/common_textfield.dart';

class CommonDropDownField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? hinttext;
  final List values;
  final checkedvalue;
  final String listMapName;
  final String listMapId;
  final screenController;
  final flex;
  final readOnly;
  final doCallback;
  final double? width;
  final double? height;

  const CommonDropDownField({
    required this.controller,
    required this.placeholder,
    required this.values,
    this.hinttext,
    this.checkedvalue,
    this.listMapName = 'name',
    this.listMapId = 'id',
    @required this.screenController,
    this.flex = 1,
    this.readOnly = false,
    this.doCallback,
    this.width,
    this.height,
  });

  @override
  Widget build(context) {
    TextEditingController terminalName = TextEditingController();
    if (readOnly) {
      for (var list in values) {
        if (checkedvalue.text == list[listMapId]) {
          terminalName.text = list[listMapName];
        }
      }
    }

    return readOnly == false
        ? SizedBox(
            width: width ?? Get.width,
            height: height ?? 37,
            child: InputDecorator(
              baseStyle: const TextStyle(fontSize: 10),
              decoration: const InputDecoration(
                // labelText: placeholder,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
                focusColor: Colors.black,
                hoverColor: Colors.black,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF2F2F2),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF2F2F2),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF2F2F2),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                labelStyle: TextStyle(color: Color(0xffB7BCCA), fontSize: 10.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20.0,
                    color: Color(0xff5C6366),
                  ),
                  style: GoogleFonts.montserrat(
                      color: const Color(0xff5C6366),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  value: checkedvalue.text != ''
                      ? checkedvalue.text
                      : values[0][listMapId].toString(),
                  isDense: true,
                  isExpanded: true,
                  items: values.map((list) {
                    return DropdownMenuItem(
                      value: list[listMapId].toString(),
                      child: list[listMapName] != ''
                          ? Text(
                              '${list[listMapName]}',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff5C6366),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          : const Text(
                              'notfound',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Drowdown value Selected: $value');
                    }
                    controller.text = value.toString();
                    if (screenController != null) {
                      screenController.update();
                    }
                    doCallback != null ? doCallback() : print('no callback');
                  },
                ),
              ),
            ),
          )
        : CommonTextField(
            controller: terminalName,
            readOnly: false,
            labelText: placeholder,
          );
  }
}

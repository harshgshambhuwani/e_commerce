

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonTextField(
    {required String hintText,
      required TextEditingController controller,
      required TextInputType keyboardType,
      bool? obscureText,
      Widget? prefixIcon,
      Widget? suffixIcon}) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13.0),
      color: Colors.white70,
    ),
    child: TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText??false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            // Remove the blue color when focused
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    ),
  ).paddingOnly(top: 20, left: 30, right: 30);
}

Widget commonBtn(
    {required String text, Widget? googleIcon, required VoidCallback onTap,Color? color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.white),
        color: color??Colors.black26,
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: googleIcon == null? MainAxisAlignment.center:MainAxisAlignment.start,
            children: [
              googleIcon ?? SizedBox.shrink(),
              Text(
                text,
                style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )).paddingAll(3),
    ),
  ).paddingSymmetric(
    horizontal: 80,
  );
}
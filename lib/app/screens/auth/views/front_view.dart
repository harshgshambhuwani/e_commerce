import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/common_widgets/auth_widgets.dart';
import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:e_commerce/app/screens/auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_view.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  int _current = 0;
  List imgList = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/splash2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: CarouselSlider(
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Opacity(
                      opacity: 0.9,
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                        height: Get.height,
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: Get.height,
              initialPage: _current,
              onPageChanged: ((index, _) => setState(() {
                    _current = index;
                  })),
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1.0,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonBtn(
                  text: "Login",
                  onTap: () {
                    authController.clearLoginControllers();
                    Get.to(() => LoginView());
                  }).paddingOnly(bottom: 20),
              commonBtn(
                  text: "Sign up",
                  onTap: () {
                    authController.clearSignUpControllers();
                    Get.to(() => SignupPage());
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}

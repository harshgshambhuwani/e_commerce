import 'package:e_commerce/app/data/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/auth_widgets.dart';
import '../../../constants/controller_const.dart';
import '../../../data/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          image: DecorationImage(
            image: AssetImage(imgLoginBg),
            fit: BoxFit.fill,
            //opacity: 0.8,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        width: double.infinity,
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonTextField(
                hintText: "Email",
                controller: authController.loginEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
              ),
              commonTextField(
                hintText: "Password",
                controller: authController.loginPasswordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _toggle();
                  },
                  color: Colors.grey,
                  icon: Icon(_obscureText
                      ? Icons.visibility_off
                      : Icons.visibility_outlined),
                ), obscureText: _obscureText,
              ),
              Obx(()=> authController.loading.value?showLoader():
               commonBtn(text: "Login", onTap: authController.LoginBtn).paddingOnly(top: 30)),
              // Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "OR",
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.anticSlab(
              //       color: Colors.white,
              //       fontSize: 18,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ).paddingSymmetric(vertical: 10),
              // ),
              // commonBtn(text: "Google", onTap: () {},googleIcon: Image.asset(
              //             icGoogle,
              //             height: 38,
              //           ).paddingOnly(right: 32)),

            ],
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}

import 'package:e_commerce/app/common_widgets/auth_widgets.dart';
import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/app_utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isChecked = false;
  bool _obscureText1 = false;
  bool _obscureText2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          image: const DecorationImage(
            image: AssetImage('assets/images/loginbg.jpg'),
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

              commonTextField(hintText: "Email", controller: authController.signupEmailController, keyboardType: TextInputType.emailAddress,prefixIcon: Icon(
                Icons.mail,
                color: Colors.grey,
              ),),
              commonTextField(hintText: "Password", controller: authController.signupPasswordController, keyboardType: TextInputType.visiblePassword,prefixIcon: Icon(
                Icons.key,
                color: Colors.grey,
              ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _toggle1();
                  },
                  color: Colors.grey,
                  icon: Icon(_obscureText1
                      ? Icons.visibility_off
                      : Icons.visibility_outlined),
                ), obscureText: _obscureText1,
              ),
              commonTextField(hintText: "Confirm Password", controller: authController.signupConfirmPassController, keyboardType: TextInputType.visiblePassword,prefixIcon: Icon(
                Icons.key,
                color: Colors.grey,
              ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _toggle2();
                  },
                  color: Colors.grey,
                  icon: Icon(_obscureText2
                      ? Icons.visibility_off
                      : Icons.visibility_outlined),
                ), obscureText: _obscureText2,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                  ),
                  Text(
                    "By creating an account you agree to our \nterms & conditions.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.nunitoSans(
                      //color: Color(0xFF666666),
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ).paddingOnly(top: 20, left: 15),
              Obx(()=>
                  authController.loading.value?showLoader():
                 commonBtn(text: "Sign Up", onTap: authController.signupBtn)
                    .paddingOnly(top: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }
}

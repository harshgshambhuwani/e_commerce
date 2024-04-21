
import 'package:e_commerce/app/screens/auth/views/front_view.dart';
import 'package:e_commerce/app/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../firebase/firebase_auth.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final User? user = AuthService().currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDynamicLinks();

  }

  _redirect() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (user==null) {
        Get.offAll(() => FrontScreen());
      } else {
        Get.offAll(() => const DashBoard());
      }
    });
  }






  Future<void> initDynamicLinks() async {
    await Future.delayed(const Duration(seconds: 3));
    _redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/ic_logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

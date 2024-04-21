
import 'package:e_commerce/app/screens/splash_view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "E-Com",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

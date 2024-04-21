import 'package:e_commerce/app/screens/auth/views/front_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../firebase/firebase_auth.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
    Get.offAll(()=>FrontScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/3dbg.jpg"),
              fit: BoxFit.cover,
              opacity: 0.4)),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ).paddingSymmetric(vertical: 20),
          Row(
            children: [
              ClipRRect(
                child: CircleAvatar(
                  radius: 40,
                ),
              ).paddingOnly(right: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Harsh Shambhuwani",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const Text(
                    "harshgshambhuwani@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          commonRow(title: "My Orders", subtitle: "Already Have 12 Orders", onTap: (){}),
          commonRow(title: "Shipping Address", subtitle: "3 Addresses", onTap: (){}),
          commonRow(title: "Payment Methods", subtitle: "Visa **34", onTap: (){}),
          commonRow(title: "Promocodes", subtitle: "you have special promocodes", onTap: (){}),
          commonRow(title: "My Reviews", subtitle: "Already Have 12 Orders", onTap: (){}),
          commonRow(title: "Settings", subtitle: "Notifications, password, Logout", onTap: (){}),
          commonRow(title: "Logout", subtitle: "Come back soon", onTap: signOut),
          Divider(),

        ],
      )),
    ).paddingOnly(top: 40, left: 16, right: 16));
  }
  Widget commonRow({required String title, required String subtitle,required VoidCallback onTap}){
    return Column(
      children: [
        Divider(),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ).paddingOnly(bottom: 10),
                   Text(
                    subtitle,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ).paddingSymmetric(vertical: 8),

      ],
    );
  }
}

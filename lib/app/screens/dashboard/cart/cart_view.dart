import 'package:e_commerce/app/data/colors.dart';
import 'package:e_commerce/app/data/styles.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",style: fontSemiBoldStyle(color: blackColor),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Coming Soon",style: fontSemiBoldStyle(color: blackColor,fontSize: 20,),)
          ],
        ),
      ),
    );
  }
}

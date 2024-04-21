// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/colors.dart';
import '../data/styles.dart';



Widget noListFound({
  required String text,
}) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
          fontRegularStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    ),
  );
}

class CustomCategoryContainer extends StatefulWidget {
  final String title;
  final String direction;
  final int productCount;
  final VoidCallback onTap;

  const CustomCategoryContainer({
    Key? key,
    required this.title,
    required this.direction,
    required this.productCount,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomCategoryContainerState createState() =>
      _CustomCategoryContainerState();
}

class _CustomCategoryContainerState extends State<CustomCategoryContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
        widget.onTap();
      },
      child: Material(
        elevation: isTapped ? 7.0 : 0.0, // Set elevation based on the tap state
        borderRadius: BorderRadius.circular(19),
        child: Container(
          height: Get.height * 0.14,
          width: Get.width * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: Colors.grey.shade400,
            border: Border.all(
              color: isTapped ? Colors.black : Colors.transparent,
              width: 2.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: widget.direction == 'right'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ).paddingOnly(
                left: widget.direction == 'right' ? 0 : 30,
                right: widget.direction == 'right' ? 30 : 0,
                top: 30,
              ),
              Text(
                '${widget.productCount} Products',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 15,
                ),
              ).paddingOnly(
                left: widget.direction == 'right' ? 0 : 30,
                right: widget.direction == 'right' ? 30 : 0,
                top: 7,
              ),
            ],
          ),
        ),
      ).paddingOnly(top: 15),
    );
  }
}


class DynamicContainer extends StatefulWidget {
  final String title;
  final String productCount;
  final VoidCallback onTap;

  const DynamicContainer(
      {Key? key,
      required this.title,
      required this.productCount,
      required this.onTap})
      : super(key: key);

  @override
  _DynamicContainerState createState() => _DynamicContainerState();
}

class _DynamicContainerState extends State<DynamicContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   isTapped = !isTapped;
        // });
        // widget.onTap();
      },
      child: Card(
        elevation: 4, // Add elevation here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: isTapped ? Colors.black : Colors.transparent),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ).paddingOnly(top: 5),
                    Text(
                      widget.productCount,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.bgImageUrl),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.bgImageUrl),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(top: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.bgImageUrl),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.bgImageUrl),
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              Text("view more +",style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),).paddingOnly(top: 5),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomDiscountCard extends StatelessWidget {
  final String discountPercent;
  final String discountDescription;
  final String discountCode;
  final String buttonText;
  final String bgImage;
  final Function()? onPressed;

  const CustomDiscountCard({
    Key? key,
    required this.discountPercent,
    required this.discountDescription,
    required this.discountCode,
    required this.buttonText,
    required this.bgImage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height * 0.16;
    double cardWidth = MediaQuery.of(context).size.width * 0.55;
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
          image: DecorationImage(
            image: NetworkImage(bgImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${discountPercent}%",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              discountDescription,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Text(
              'With code_ $discountCode',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ).paddingOnly(top: 5),
          ],
        ).paddingOnly(top: 20, left: 15),
      ),
    ).paddingOnly(bottom: 10, left: 10);
  }
}


class CustomCardWidget extends StatefulWidget {
  final String name;
  final String price;
  bool isHeartRed;
  final VoidCallback onTap;
  final String bgImageUrl; // Add this line

  CustomCardWidget({super.key,
    required this.name,
    required this.price,
    required this.isHeartRed,
    required this.onTap,
    required this.bgImageUrl, // Add this line
  });

  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage(widget.bgImageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ).paddingOnly(left: 10),
        ),
        Text(
          widget.name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.price,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


class ProductWidget extends StatelessWidget {
  final String name;
  final String productName;
  final double rating;
  final double price;

  ProductWidget({
    required this.name,
    required this.productName,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 110,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
            ).paddingAll(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  productName,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.normal),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      "(${rating.toString()})",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ).paddingOnly(top: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${price.toString()}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ).paddingOnly(left: 50),
          ],
        ),
      ),
    );
  }
}


Widget buildCategoryItem(String categoryName, int index) {
 // bool isSelected = homeController.selectedCategoryIndex == index;
  //homeController.selectedCategoryIndex == categoryName;



  return GestureDetector(
    onTap: () {
      //homeController.setSelectedCategoryIndex(index);
    },
    child: Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
        // color: isSelected ? Colors.black : Colors.white,
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  //color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    ),
  ).paddingSymmetric(horizontal: 5,vertical: 5),
  );
}










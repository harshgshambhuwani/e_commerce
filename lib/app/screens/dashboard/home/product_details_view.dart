import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/common_widgets/auth_widgets.dart';
import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:e_commerce/app/data/colors.dart';
import 'package:e_commerce/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatefulWidget {
  final Data model;

  const ProductDetailsView({super.key, required this.model});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final Data model = widget.model;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: CarouselSlider(
                    items: model.images?.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Opacity(
                              opacity: 0.9,
                              child: Image.network(
                                imgUrl,
                                fit: BoxFit.cover,
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
                Positioned(
                  top: 60,
                  left: 10,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 28,).paddingOnly(left: 10),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "\$ ${model.price.toString()}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        if(model.isLiked == false){
                          setState(() {
                            model.setIsLiked = true;
                            homeController.favouriteProductList.add(model);
                          });
                        }else{
                          setState(() {
                            model.setIsLiked = false;
                            homeController.favouriteProductList.remove(model);
                          });
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: redColor,
                        radius: 20,
                        child: bool.parse(model.isLiked.toString()) == false?Icon(Icons.favorite_border_rounded,color: Colors.white,):Icon(Icons.favorite,color: Colors.white,),
                      ),
                    )
                  ],
                ).paddingSymmetric(vertical: 10),
                Divider(),
                Text(
                  "Description of Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  model.description.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ).paddingSymmetric(vertical: 10),
                SizedBox(
                        height: 50,
                        child: commonBtn(
                            text: "Buy", onTap: () {}, color: redColor))
                    .paddingOnly(bottom: 10),
                SizedBox(
                    height: 50,
                    child: commonBtn(
                        text: "Add to Cart", onTap: () {}, color: blackColor)),
                Text(
                  "Ratings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: Icon(Icons.favorite),
                    half: Icon(Icons.favorite_border_rounded),
                    empty: Icon(Icons.favorite_border_rounded),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ).paddingAll(10),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:e_commerce/app/models/product_model.dart';
import 'package:e_commerce/app/screens/dashboard/home/product_details_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/widgets.dart';
import '../../../data/app_utils.dart';
import '../../../firebase/firebase_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    homeController.productListScrollController.addListener(() {
      if(homeController.productListScrollController.position.maxScrollExtent==homeController.productListScrollController.offset){
        homeController.productListPagination();
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "E COMMERCE",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        ()=> RefreshIndicator(
          onRefresh: () {
            return homeController.productListApi(isFromRefresh: true,isFirstTime: true);
          },
          child:
          homeController.loading.value
              ? showLoader()
              : homeController.productList.isEmpty
              ? noListFound(text: "Post Not Found")
              :
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                headingRowWidget(title: "TRENDING", onTap: () {}),
                Container(
                    height: 165,
                    width: 330,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.green.shade200],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      border: Border.all(color: Colors.black12, width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.productList.length > 3
                            ? 3
                            : homeController.productList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Get.to(()=>ProductDetailsView(model: homeController.productList[index]));
                            },
                            child: trendingCard(
                                context: context,
                                index: index,
                                model: homeController.productList[index]),
                          );
                        })),
                Container(
                  height: 200,
                  width: 330,
                  decoration: const BoxDecoration(
                      color: Color(0xFF64B5D7),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "NEW ARRIVAL",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ).paddingAll(10),
                      Expanded(
                        child: ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.productList.length > 3
                                ? 3
                                : homeController.productList.length,
                            itemBuilder: (context, index) {
                              return InkWell(

                                onTap: (){
                                  Get.to(()=>ProductDetailsView(model: homeController.productList[index]));
                                },
                                child: newArrivalCard(
                                    context: context,
                                    index: index,
                                    model: homeController.productList[index]),
                              );
                            }),
                      )
                    ],
                  ),
                ).paddingOnly(top: 20),
                headingRowWidget(title: "TOP RATED", onTap: () {}),
                Container(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: homeController.productList.length > 10
                          ? 10
                          : homeController.productList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Get.to(()=>ProductDetailsView(model: homeController.productList[index]));
                          },
                          child: topRatedCard(
                              context: context,
                              index: index,
                              model: homeController.productList[index]),
                        );
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/3dbg.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.4)),
                  child: Column(
                    children: [
                      headingRowWidget(title: "Fashion \nCollection", onTap: () {}),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: homeController.productList.length>20?20:homeController.productList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Get.to(()=>ProductDetailsView(model: homeController.productList[index]));
                            },
                            child: fashionCollectionCard(
                                context: context,
                                index: index,
                                model: homeController.productList[index]),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 5),
          ),
        ),
      ),
    );
  }

  Widget trendingCard(
      {required BuildContext context,
      required int index,
      required Data model}) {
    return Container(
      height: 130,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:  DecorationImage(
          image: NetworkImage(model.images![0]),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white,
                ],
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Product ${model.id.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ).paddingAll(10);
  }

  Widget newArrivalCard(
      {required BuildContext context,
      required int index,
      required Data model}) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage(model.images![0]),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.0),
                  // Offset of the shadow
                  blurRadius: 4.0, // Blur radius
                ),
              ],
            ),
          ).paddingOnly(left: 10, top: 5),
           Text(
            model.category!.name.toString(),
            style: TextStyle(
              fontSize: 12,
            ),
          ).paddingOnly(left: 15, top: 5),
           Text(
            "\$${model.price.toString()}",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ).paddingOnly(left: 15, top: 1),
        ],
      ),
    );
  }

  Widget topRatedCard(
      {required BuildContext context,
      required int index,
      required Data model}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.2),
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
              image: NetworkImage(model.images![0].toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
         Text(
          model.category!.name.toString(),
          style: TextStyle(
            fontSize: 17,
          ),
        ).paddingOnly(left: 10, top: 5),
        Row(
          children: [
             Text(
              "\$${model.price.toString()}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ).paddingOnly(left: 10, top: 3),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: const Row(
                children: [
                  Text(
                    "5.0",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ),
            ).paddingOnly(left: 25),
          ],
        ),
      ],
    ).paddingAll(10);
  }

  Widget fashionCollectionCard(
      {required BuildContext context,
      required int index,
      required Data model}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            model.images![1],
            height: 120,
          ),

        ),
         Text(
          model.category!.name.toString(),
          style: TextStyle(
            fontSize: 18,
          ),
        ).paddingOnly(left: 10, top: 5),
        Text(
          "\$${model.price.toString()}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget headingRowWidget(
      {required String title, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            "View All",
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
      ],
    ).paddingAll(16);
  }
}

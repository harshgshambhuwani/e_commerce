import 'package:e_commerce/app/common_widgets/widgets.dart';
import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:e_commerce/app/screens/dashboard/home/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Favourites",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/3dbg.jpg"),
                fit: BoxFit.cover,
                opacity: 0.4)),
        height: Get.height,
        width: Get.width,
        child: Obx(()=>
            homeController.favouriteProductList.isEmpty?noListFound(text: "No Favorite Products"):
            SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: homeController.favouriteProductList.length,
                  itemBuilder: (context, index) {
                    var model = homeController.favouriteProductList[index];
                    return InkWell(
                      onTap: (){
                        Get.to(()=>ProductDetailsView(model: model));
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(model.images![0].toString(),height: 120,),
                          ),
                          Text(
                            model.category!.name.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ).paddingOnly(left: 10, top: 5),
                          Text(
                            "\$ ${model.price.toString()}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ).paddingSymmetric(vertical: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

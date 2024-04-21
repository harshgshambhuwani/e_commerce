import 'package:e_commerce/app/constants/controller_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_bottom_nav_bar.dart';
import '../../data/app_utils.dart';
import '../../controllers/root_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final arg = Get.arguments;

  final RootController drawerController = Get.put(RootController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initialiseDashboard();

    });
    super.initState();
  }

  void initialiseDashboard() async{
    await homeController.productListApi(isFromRefresh: false,isFirstTime: true);
  }


  bool _isBackPressed = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body:  WillPopScope(
          onWillPop: () async {
            if (_isBackPressed) {
              return true;
            } else {
              _isBackPressed = true;
              showToast(message: "Press the back button twice to exit");
              Future.delayed(const Duration(seconds: 2), () {
                _isBackPressed = false;
              });

              return false;
            }
          },
          child: drawerController.currentPage,

        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: Colors.white,
          itemColor: Colors.black,
          currentIndex: drawerController.currentIndex.value,
          onChange: (index) {
            drawerController.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_rounded,
              label: "Home".tr, color: Colors.black,
            ),
            CustomBottomNavigationItem(
              icon: Icons.shopping_cart,
              label: "Cart".tr,color: Colors.black,
            ),
            CustomBottomNavigationItem(
              icon: Icons.favorite,
              label: "Favourite".tr,color: Colors.black,
            ),
            CustomBottomNavigationItem(
              icon: Icons.person,
              label: "Account".tr,color: Colors.black,
            ),
          ],
        ),
      );
    });
  }


}









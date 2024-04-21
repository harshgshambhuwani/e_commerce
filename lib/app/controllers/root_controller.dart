/*
 * Copyright (c) 2020 .
 */

import 'package:e_commerce/app/screens/dashboard/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/dashboard/favourite/favourite_view.dart';
import '../screens/dashboard/home/home_view.dart';
import '../screens/dashboard/profile/my_profile_view.dart';
class RootController extends GetxController {
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;
  final RxBool isDrawerOpen = false.obs;


  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }
  @override
  void onInit() {
    super.onInit();
    // Initialize your controller's state here
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(0);
    }
    super.onInit();
  }
  List<Widget> pages = [
    HomeView(),
    CartView(),
    FavouriteView(),
    MyProfileView(),
  ];

  Widget get currentPage => pages[currentIndex.value];


  /// change page in route
  ///
  void changePageInRoot(int index) {
    currentIndex.value = index;
  }

  void changePageOutRoot(int index) {
    // debugPrint("what the hell:${currentIndex.value}");

    currentIndex.value = index;
    // Get.offNamedUntil(Routes.ROOT, (Route route) {
    //   if (route.settings.name == Routes.ROOT) {
    //     return true;
    //   }
    //   return false;
    // }, arguments: _index);
  }

  Future<void> changePage(int index) async {
    currentIndex(index);

    // if (Get.currentRoute == Routes.ROOT) {
    //   changePageInRoot(_index);
    // } else {
    //   changePageOutRoot(_index);
    // }
    await refreshPage(index);
  }

  Future<void> refreshPage(int index) async {
    switch (index) {
    // case 0:
    //   {
    //     await Get.find<HomeController>().refreshHome();
    //     break;
    //   }
    // case 2:
    //   {
    //     await Get.find<MessagesController>().refreshMessages();
    //     break;
    //   }
    }
  }

// void getNotificationsCount() async {
//   notificationsCount.value = await _notificationRepository!.getCount();
// }
//
// Future<void> getCustomPages() async {
//   customPages.assignAll(await _customPageRepository!.all());
// }


}

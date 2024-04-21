import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/controller_const.dart';
import '../constants/url_constants.dart';
import '../data/api_helper.dart';
import '../data/app_utils.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  var productList = <Data>[].obs;
  var favouriteProductList = <Data>[].obs;
  var loading = false.obs;
  var addProductLoading = false.obs;
  var bottomLoading = false.obs;
  var totalProduct=100.obs;
  var page = 1.obs;
  final ScrollController productListScrollController = ScrollController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();


  ///=========================================== API =====================================

  ///==================================== Products List API =============================
  productListPagination() {
    if (!bottomLoading.value) {
      bottomLoading(true);

      if (totalProduct.value > productList.length) {
        page.value++;
        bottomLoading(true);
        homeController.productListApi(isFirstTime: false);
      }
    }
  }

  productListApi({bool? isFromRefresh, required bool isFirstTime}) async {
    if (isFromRefresh != true && bottomLoading.value != true) {
      loading(true);
    }
    if (isFirstTime == true) {
      page.value = 1;
    }
    await ApiHelper.get(
      api: "${UrlConstant.productListUrl}?_limit=10&_page=${page.value}",
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        log(obj.toString());
        if (isFirstTime == true) {
          productList.clear();
          productList(createPackageList(obj));
        }else{
          productList.addAll(createPackageList(obj));
        }
        // productModel model = productModel.fromJson(obj);
        // totalproduct = model.data?.length;

        bottomLoading(false);
        return productList;
      },
      onFailure: ({required message}) {
        loading(false);
        bottomLoading(false);
        showToast(message: message);
      },
    );
  }

  List<Data> createPackageList(List data) {
    List<Data> list = [];
    for (int i = 0; i < data.length; i++) {
      Data model = Data.fromJson(data[i]);
      list.add(model);
    }
    return list;
  }



}

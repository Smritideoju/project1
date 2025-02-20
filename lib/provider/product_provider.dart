

import 'package:flutter/material.dart';
import 'package:test_2/api_response/api_response.dart';
import 'package:test_2/core/status_util.dart';
import 'package:test_2/model/product.dart';
import 'package:test_2/service/product_service.dart';
import 'package:test_2/service/product_service_impl.dart';

class ProductProvider extends ChangeNotifier {
  List<Autogenerated>productList = [];
 
  ProductService productService = ProductServiceImpl();

  StatusUtils getUserStatus = StatusUtils.none;
  setUserStatus1(StatusUtils status) {
    getUserStatus = status;
    notifyListeners();
  }


    Future<void> getUser() async {
      if (getUserStatus != StatusUtils.loading) {
       
      }
      ApiResponse response = await productService.getProducts();
      if (response.statusUtils == StatusUtils.success) {
        productList.addAll((response.data as List<dynamic>).map((e) => Autogenerated.fromJson(e as Map<String,dynamic>)).toList());
        setUserStatus1(StatusUtils.success);
      } else if (response.statusUtils == StatusUtils.error) {
        setUserStatus1(StatusUtils.error);
      }
    }
  }


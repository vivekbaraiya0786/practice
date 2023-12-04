import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:techinal_practice/Modals/json/product_modal.dart';

import '../../Modals/json/products.dart';

class Product_Provider extends ChangeNotifier{
  Product_Modal product_modal = Product_Modal(product: []);

  Future<void> loadData()async{
    String data = await rootBundle.loadString("assets/json/product.json");
    // print("data : ${data}");
    Map decodedata = jsonDecode(data);
    List productData = decodedata['ProductsData'];

    product_modal.product = productData.map((e) => Product.fromJson(json: e)).toList();

    notifyListeners();
  }
}
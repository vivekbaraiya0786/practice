import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/controller/json/prooduct_controller.dart';

import '../../Modals/json/products.dart';

class Product_home extends StatefulWidget {
  const Product_home({super.key});

  @override
  State<Product_home> createState() => _Product_homeState();
}

class _Product_homeState extends State<Product_home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();

  }

  Future<void> loaddata()async{
    await Provider.of<Product_Provider>(context,listen: false).loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
        // itemCount: productModal.product.length,
        itemCount:Provider.of<Product_Provider>(context).product_modal.product.length ,
        itemBuilder: (context, index) {
          List<ProductsDatum> productsData = Provider.of<Product_Provider>(context).product_modal.product[index].productsData;
          print(productsData);
          return ListTile(
            title: Text(productsData[index].id ?? 'No Name'),
            // subtitle: Text(productsData.price != null ? '\$${productsData.price}' : 'No Price'),
            // You can add more widgets to display other properties of the product.
          );
        },
      )
    );
  }
}

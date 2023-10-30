import 'dart:convert';

class Product {
  List<ProductsDatum> productsData;

  Product({
    required this.productsData,
  });



  factory Product.fromJson({required Map<String, dynamic> json}) => Product(
    productsData: List<ProductsDatum>.from(json["ProductsData"].map((x) => ProductsDatum.fromJson(json: x))),
  );

}

class ProductsDatum {
  String id;
  String? category;
  String? name;
  String? image;
  String? price;
  String? ratings;

  ProductsDatum({
    required this.id,
    this.category,
    this.name,
    this.image,
    this.price,
    this.ratings,
  });



  factory ProductsDatum.fromJson({required Map<String, dynamic> json}) => ProductsDatum(
    id: json["Id"],
    category: json["Category"],
    name: json["Name"],
    image: json["Image"],
    price: json["Price"],
    ratings: json["Ratings"],
  );

}

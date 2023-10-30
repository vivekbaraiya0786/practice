import 'dart:typed_data';

class CategoryModel {
  int? categoryId;
  String categoryName;
  String categoryType;
  int categoryPrice;

  CategoryModel({
    this.categoryId,
    required this.categoryName,
    required this.categoryType,
    required this.categoryPrice,
  });

  factory CategoryModel.fromMap({required Map<String, dynamic> data}) {
    return CategoryModel(
      categoryId: data['id'],
      categoryName: data['cat_name'],
      categoryType: data['cat_type'],
      categoryPrice: data['cat_price'],
    );
  }
}
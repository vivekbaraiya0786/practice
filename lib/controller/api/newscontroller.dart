import 'package:flutter/cupertino.dart';
import 'package:techinal_practice/Modals/api/news_modal.dart';
import 'package:techinal_practice/helper/api/api_helper.dart';

class NewsProvider extends ChangeNotifier {
  String location = "us";
  String category = "sports";

  void newlocation(String Newlocation) {
    location = Newlocation;
    notifyListeners();
  }

  void newcategory(String Newcategory) {
    category = Newcategory;
    notifyListeners();
  }

  Future<News?> newsdata(String country, String category) async {
    News? news = await ApiHelper.apiHelper.fetchNews(country, category);
    return news;
  }
}

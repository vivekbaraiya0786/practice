import 'package:flutter/cupertino.dart';

import '../../Modals/api/wather_modal.dart';
import '../../helper/api/api_helper.dart';

class WeatherProvider extends ChangeNotifier{


  String country = "London";
  String days = "1";

  void newCountry(String newCountry){
    country = newCountry;
    notifyListeners();
  }

  void newDays(String newDays){
    days = newDays;
    notifyListeners();
  }

  Future<WeatherModal?> weatherdata(String country,String days)async{
    WeatherModal? weatherModal =  await ApiHelper.apiHelper.fetchWeather(country, days);
    return weatherModal;
  }

}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Modals/api/news_modal.dart';
import '../../Modals/api/wather_modal.dart';
import 'package:dio/dio.dart';


class ApiHelper{
  ApiHelper._();
  static final ApiHelper apiHelper =ApiHelper._();
  Dio dio = Dio();

  Future<News?> fetchNews(String country,String category)async{
    String baseUrl  = "https://newsapi.org/v2/top-headlines?country=$country&category =$category&apiKey=80efab41678840cc9a5ccc0dd8060dd5";
    http.Response res = await http.get(Uri.parse(baseUrl));
    // print("Res : $res");

    if(res.statusCode == 200){
      // print(res.statusCode);

      String data = res.body;
      // print("body : ${res.body}");
      Map<String,dynamic>  decodeList = jsonDecode(data);
      News news = News.fromJson(json: decodeList);
      return news;
    }
    return null;
  }


  // Future<WeatherModal?> fetchWeather(String country,String days)async{
  //   String uri = "http://api.weatherapi.com/v1/forecast.json?key=0e13ee46ce054e1c96373357232410&q=$country&days=$days&aqi=yes&alerts=yes";
  //   http.Response response= await http.get(Uri.parse(uri));
  //   // print("Response : $response ");
  //   if(response.statusCode == 200){
  //     // print("status code : ${response.statusCode}");
  //     String data =  response.body;
  //     // print("data : ${data}");
  //     Map<String,dynamic> decodeList = jsonDecode(data);
  //     // print("decodelist : $decodeList ");
  //     WeatherModal weatherModal = WeatherModal.fromJson(json: decodeList);
  //     // print("werather modal : $weatherModal");
  //     return weatherModal;
  //   }else{
  //     print("data not found");
  //   }
  //   return null;
  // }


  Future<WeatherModal?> fetchWeather(String country,String days)async{
    String uri = "http://api.weatherapi.com/v1/forecast.json?key=0e13ee46ce054e1c96373357232410&q=$country&days=$days&aqi=yes&alerts=yes";
    Response response = await dio.get(uri);

    if(response.statusCode == 200){
      print("status code : ${response.statusCode}");
      Map<String, dynamic> decodeList =  response.data;
      print("data : ${decodeList}");
      WeatherModal weatherModal = WeatherModal.fromJson(json: decodeList);
      return weatherModal;
    }else{
      print("data not found");
    }
    return null;
  }


}
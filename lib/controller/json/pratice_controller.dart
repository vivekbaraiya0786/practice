import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:techinal_practice/Modals/json/practice_modal.dart';
import 'package:techinal_practice/Modals/json/pratice.dart';

class PraticeJsonProvider extends ChangeNotifier{
  Pratice pratice = Pratice(pratice: []);


  loadJson()async{
   String data = await rootBundle.loadString("assets/json/practice.json");

   List decodeList = jsonDecode(data);

   pratice.pratice = decodeList.map((e) => PracticeModal.fromJson(json: e)).toList();
   notifyListeners();
  }
}
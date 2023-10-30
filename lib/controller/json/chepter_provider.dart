import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:techinal_practice/Modals/json/chepter_modal.dart';

import '../../Modals/json/verse_modal.dart';


class ChepterProvider extends ChangeNotifier{
  ChepterModal chepterModal = ChepterModal(chepter: []);

  Future<void>loadjson()async{
    String data = await rootBundle.loadString("assets/json/verse.json");
    List decodelist =  jsonDecode(data);
    chepterModal.chepter = decodelist.map((e) => Verse.fromJson(json : e)).toList();
    notifyListeners();
  }
}

/*

first rootbundle.loadstring provide jsondata path
after decode this data using jsondecode and store data in list or dynamic
after this list loop will turn around

 */
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:techinal_practice/Modals/json/chepter_modal.dart';
//
// import '../../Modals/json/verse_modal.dart';
//
//
// class ChepterProvider extends ChangeNotifier{
//   ChepterModal chepterModal = ChepterModal(chepter: []);
//
//   Future<void>loadjson()async{
//     String data = await rootBundle.loadString("assets/json/verse.json");
//     List decodelist =  jsonDecode(data);
//     chepterModal.chepter = decodelist.map((e) => Verse.fromJson(json : e)).toList();
//     notifyListeners();
//   }
// }

/*

first rootbundle.loadstring provide jsondata path
after decode this data using jsondecode and store data in list or dynamic
after this list loop will turn around

 */

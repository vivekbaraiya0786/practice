import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:techinal_practice/Modals/json/album_list_modal.dart';

import '../../Modals/json/album_modal.dart';

class AlbumProvider extends ChangeNotifier{
  AlbumModal albumModal = AlbumModal( album: []);

  Future<void>loadjson()async{
    String data = await rootBundle.loadString("assets/json/album.json");
    List decodelist =  jsonDecode(data);
    albumModal.album = decodelist.map((e) => Album.fromJson(json : e)).toList();
    notifyListeners();
  }
}


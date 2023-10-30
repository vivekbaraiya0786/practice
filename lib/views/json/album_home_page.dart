import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/controller/json/album_provider.dart';

class Album_home extends StatefulWidget {
  const Album_home({super.key});

  @override
  State<Album_home> createState() => _Album_homeState();
}

class _Album_homeState extends State<Album_home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    Provider.of<AlbumProvider>(context, listen: false).loadjson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
      ),
      body: ListView.builder(
        itemCount: Provider.of<AlbumProvider>(
          context,
        ).albumModal.album.length,
        itemBuilder: (context, index) {
          return ListTile(

            leading: CircleAvatar(
               backgroundImage: NetworkImage("${Provider.of<AlbumProvider>(context).albumModal.album[index].thumbnailUrl}"),
            ),
            trailing: Text("${Provider.of<AlbumProvider>(context).albumModal.album[index].id}"),
          );
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/Modals/json/verse_modal.dart';

import '../../controller/json/chepter_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    // fetchdata1();
    // fetchdata();
    // loadData();
    // loadData1();
  }

  Future<void> getdata() async {
    Provider.of<ChepterProvider>(context, listen: false).loadjson();
  }

  String data = '{"id":1,"name":"vivek","course":"MFD","age":22}';
  Map decodedata = {};

  fetchdata() {
    decodedata = jsonDecode(data);
  }

  StudentModal? s1;

  fetchdata1() {
    s1 = StudentModal.fromMap(data: jsonDecode(data));
    print(s1!.id);
    print(s1!.age);
    print(s1!.name);
    print(s1!.course);
  }

  List<StudentModal> s2 = [];
  List decodedata1 = [];
  String? data1;

  Future<void> loadData() async {
    data1 = await rootBundle.loadString("assets/json/practice1.json");
    decodedata1 = jsonDecode(data1!);
    s2 = decodedata1.map((e) => StudentModal.fromMap(data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // setState(() {
        //       //   decodedata = jsonDecode(data);
        //       //   print("decode data : $decodedata");
        //       // });
        //
        //       // setState(() {
        //       //   s1 = StudentModal.fromMap(data: jsonDecode(data));
        //       //   print(s1?.id);
        //       //   print(s1?.age);
        //       //   print(s1?.name);
        //       //   print(s1?.course);
        //       // });
        //
        //       // decodedata1 = jsonDecode(data1!);
        //       // setState(() {
        //       //   s2 = decodedata1
        //       //       .map((e) => StudentModal.fromMap(data: e))
        //       //       .toList();
        //       // });
        //     },
        //     icon: const Icon(Icons.refresh),
        //   ),
        // ],
      ),
      // body: (decodedata != null)
      //     // ? ListTile(
      //     //     isThreeLine: true,
      //     //     // leading: Text("${decodedata['id']}"),
      //     //     // title: Text("${decodedata['name']}"),
      //     //     // subtitle: Text("${decodedata['course']}"),
      //     //     // trailing: Text("${decodedata['age']}"),
      //     //
      //     //     leading: Text("${s1!.id}"),
      //     //     title: Text(s1!.name),
      //     //     subtitle: Text(s1!.course),
      //     //     trailing: Text("${s1!.age}"),
      //     //   )
      //
      //     ? ListView.builder(
      //         itemCount: s2.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             isThreeLine: true,
      //             leading: Text("${s2[index].id}"),
      //             title: Text(s2[index].name),
      //             subtitle: Text(s2[index].course),
      //             trailing: Text("${s2[index].age}"),
      //           );
      //         },
      //       )
      //     : const Center(child: Text("Data not available")),
      body: ListView.builder(
        itemCount:
            Provider.of<ChepterProvider>(context).chepterModal.chepter.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
                "${Provider.of<ChepterProvider>(context).chepterModal.chepter[index].id}"),
            title: Text(Provider.of<ChepterProvider>(context)
                .chepterModal
                .chepter[index]
                .name),
            subtitle: Text(Provider.of<ChepterProvider>(context)
                .chepterModal
                .chepter[index]
                .nameTranslation),
            onTap: () {
              Get.toNamed("/Sholak_page",
                  arguments:
                      Provider.of<ChepterProvider>(context, listen: false)
                          .chepterModal
                          .chepter[index]);
            },
            trailing: IconButton(
              onPressed: () {
                Get.toNamed("/Sholak_page",
                    arguments:
                        Provider.of<ChepterProvider>(context, listen: false)
                            .chepterModal
                            .chepter[index]);
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          );
        },
      ),
    );
  }
}

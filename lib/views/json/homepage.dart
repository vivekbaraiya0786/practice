import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

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
  }

  Future<void> getdata() async {
    Provider.of<ChepterProvider>(context, listen: false).loadjson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: ListView.builder(
        itemCount:
            Provider.of<ChepterProvider>(context).chepterModal.chepter.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
                "${Provider.of<ChepterProvider>(context).chepterModal.chepter[index].id}"),
            title: Text(
                Provider.of<ChepterProvider>(context).chepterModal.chepter[index].name),
            subtitle: Text(
                Provider.of<ChepterProvider>(context).chepterModal.chepter[index].nameTranslation),
            onTap: () {
              Get.toNamed("/Sholak_page",
                  arguments: Provider.of<ChepterProvider>(context,listen: false)
                      .chepterModal
                      .chepter[index]);
            },
            trailing: IconButton(
              onPressed: () {
                Get.toNamed("/Sholak_page",
                    arguments: Provider.of<ChepterProvider>(context,listen: false)
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

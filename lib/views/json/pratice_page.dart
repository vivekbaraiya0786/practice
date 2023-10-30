import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/controller/json/pratice_controller.dart';

class Pratice_page extends StatefulWidget {
  const Pratice_page({super.key});

  @override
  State<Pratice_page> createState() => _Pratice_pageState();
}

class _Pratice_pageState extends State<Pratice_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() {
    Provider.of<PraticeJsonProvider>(context, listen: false).loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(Provider.of<PraticeJsonProvider>(context).pratice.pratice[1].text),
        ],
      )
      // Container(
      //   child: ListView.builder(
      //     itemCount:
      //         Provider.of<PraticeJsonProvider>(context).pratice.pratice.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(Provider.of<PraticeJsonProvider>(context).pratice.pratice[index].text),
      //         subtitle: Text(Provider.of<PraticeJsonProvider>(context).pratice.pratice[index].nameTranslation),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}

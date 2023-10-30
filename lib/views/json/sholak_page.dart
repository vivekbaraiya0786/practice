import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Modals/json/verse_modal.dart';

class Sholak_page extends StatefulWidget {
  const Sholak_page({Key? key});

  @override
  State<Sholak_page> createState() => _Sholak_pageState();
}

class _Sholak_pageState extends State<Sholak_page> {
  @override
  Widget build(BuildContext context) {
    Verse verse = ModalRoute.of(context)!.settings.arguments as Verse;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sholak Page"),
      ),
      body: ListView.builder(
        itemCount: verse.sholk?.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(verse.sholk![index].id),
            title: Text(verse.sholk![index].text),
            trailing: IconButton(
              onPressed: () {
                // Navigate to the second page with the selected Sholk
                Navigator.of(context).pushNamed('/SholakDetailPage', arguments: verse.sholk![index]);
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          );
        },
      ),
    );
  }
}

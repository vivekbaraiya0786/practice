import 'package:flutter/material.dart';

import '../../Modals/json/verse_modal.dart';
class SholakDetailPage extends StatefulWidget {
  const SholakDetailPage({Key? key}) : super(key: key);

  @override
  _SholakDetailPageState createState() => _SholakDetailPageState();
}

class _SholakDetailPageState extends State<SholakDetailPage> {




  @override
  Widget build(BuildContext context) {
    Sholk sholk = ModalRoute.of(context)!.settings.arguments as Sholk;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sholak Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sholk.id),
            const SizedBox(
              height: 10,
            ),
            Text(sholk.descriptionh),
            const SizedBox(
              height: 10,
            ),
            Text(sholk.transliteration),
            const SizedBox(
              height: 10,
            ),
            Text("${sholk.wordMeanings}"),
          ],
        ),
      ),
    );
  }
}

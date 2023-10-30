import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techinal_practice/Modals/api/wather_modal.dart';
import 'package:techinal_practice/controller/api/weather_provider.dart';

import '../../controller/api/newscontroller.dart';

class weather_home extends StatefulWidget {
  const weather_home({super.key});

  @override
  State<weather_home> createState() => _weather_homeState();
}

class _weather_homeState extends State<weather_home> {
  WeatherModal? weatherModal;



  TextEditingController countyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body:
      FutureBuilder(
        future: Provider.of<WeatherProvider>(context, listen: false).weatherdata(
          Provider.of<WeatherProvider>(context, listen: true).country,
          Provider.of<WeatherProvider>(context, listen: true).days,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            WeatherModal? weatherModal = snapshot.data;
            print(weatherModal);

            return (weatherModal == null)
                ? const Center(
              child: Text("No Data available"),
            )
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // TextField(
                  //     controller: countyController,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: "Enter country",
                  //     ),
                  //     onSubmitted: (value) {
                  //       if (value.isNotEmpty) {
                  //         // print("===========");
                  //         // print(value);
                  //         // print("===========");
                  //         Provider.of<NewsProvider>(context,
                  //             listen: false)
                  //             .newlocation(value);
                  //       }
                  //       countyController.clear();
                  //     }),
                  // const SizedBox(height: 15),
                  // TextField(
                  //     controller: categoryController,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: "Enter category",
                  //     ),
                  //     onSubmitted: (value) {
                  //       if (value.isNotEmpty) {
                  //         // print("===========");
                  //         // print(value);
                  //         // print("===========");
                  //         Provider.of<NewsProvider>(context,
                  //             listen: false)
                  //             .newcategory(value);
                  //       }
                  //       categoryController.clear();
                  //     }),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        // Article? article = weatherModal.articles[index];
                        // Source? source = weatherModal.articles[index].source;
                       // Location location = weatherModal.location;
                        return Container(
                          child: Column(
                            children: [
                              Text("${weatherModal.date}"),
                              Text("${weatherModal.name}"),
                              Text("${weatherModal.country}"),
                              Text("${weatherModal.text}"),
                              Text("${weatherModal.is_day}"),
                              Text("${weatherModal.maxtemp_c}"),
                              Text("${weatherModal.sunrise}"),

                              SingleChildScrollView(
                                child: Column(
                                  children: weatherModal.hour.map((e) => Text("${e['time_epoch']}")).toList(),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: weatherModal.hour.map((e) => Text("${e['condition']['text']}")).toList(),
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: weatherModal.hour.map((e) => CircleAvatar(backgroundImage: NetworkImage("${e['condition']['icon']}"),)).toList(),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

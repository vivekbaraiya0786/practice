import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Modals/api/news_modal.dart';
import '../../controller/api/newscontroller.dart';

class News_home extends StatefulWidget {
  const News_home({super.key});

  @override
  State<News_home> createState() => _News_homeState();
}

class _News_homeState extends State<News_home> {
  TextEditingController countyController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<NewsProvider>(context, listen: false).newsdata(
          Provider.of<NewsProvider>(context, listen: true).location,
          Provider.of<NewsProvider>(context, listen: true).category,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            News? newsdata = snapshot.data;
            print(newsdata);
            return (newsdata == null)
                ? const Center(
                    child: Text("No Data available"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                            controller: countyController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter country",
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                // print("===========");
                                // print(value);
                                // print("===========");
                                Provider.of<NewsProvider>(context,
                                        listen: false)
                                    .newlocation(value);
                              }
                              countyController.clear();
                            }),
                        const SizedBox(height: 15),
                        TextField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter category",
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                // print("===========");
                                // print(value);
                                // print("===========");
                                Provider.of<NewsProvider>(context,
                                        listen: false)
                                    .newcategory(value);
                              }
                              categoryController.clear();
                            }),
                        Expanded(
                          child: ListView.builder(
                            itemCount: newsdata.articles.length,
                            itemBuilder: (context, index) {
                              Article? article = newsdata.articles[index];
                              Source? source = newsdata.articles[index].source;
                              return ListTile(
                                title: Text(article.title),
                                subtitle: Text("${source.name}"),
                                // Add more UI elements here as needed...
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

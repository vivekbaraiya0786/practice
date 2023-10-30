import 'package:flutter/material.dart';
import 'package:techinal_practice/Modals/database/category_modal.dart';
import 'package:techinal_practice/helper/database/db_helper.dart';
import 'package:get/get.dart';

class fetchdata extends StatefulWidget {
  const fetchdata({super.key});

  @override
  State<fetchdata> createState() => _fetchdataState();
}

class _fetchdataState extends State<fetchdata> {
  // late Future<List<Map<String, dynamic>>>? fetchdata;
   late Future<List<CategoryModel>> fetchdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata = dbHelper.dbhelper.fetchallcategory();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController typecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  String? catname;
  String? cattype;
  int? catprice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(),
          onChanged: (value) async{
           setState(() {
             fetchdata = dbHelper.dbhelper.fetchseaarchcategory(data: value);
           });
          },
        ),
      ),
      body: FutureBuilder(
        future: fetchdata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR :${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryModel>? data = snapshot.data;
            print("data : $data");
            return Container(
              child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // leading: Text("${data![index]['id']}"),
                    // title: Text("${data[index]['cat_name']}"),
                    // subtitle: Text("${data[index]['cat_price']}"),
                    leading: Text("${data![index].categoryId}"),
                    title: Text("${data[index].categoryName}"),
                    subtitle: Text("${data[index].categoryPrice}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () async {
                              int res = await dbHelper.dbhelper
                                  .deletecategory(id: data[index].categoryId!);

                              if (res >= 1) {
                                Get.showSnackbar(GetSnackBar(
                                  title: "delete Successfully",
                                  message: "category if $res ",
                                  backgroundColor: Colors.green,
                                  duration: const Duration(seconds: 3),
                                ));
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: "delete unSuccessfully",
                                  message: "category if $res ",
                                  backgroundColor: Colors.red,
                                ));
                              }
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) => StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text("Update"),
                                    content: Form(
                                      key: formkey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: namecontroller,
                                            decoration:  InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "${data[index].categoryName}",
                                            ),
                                            onSaved: (value) {
                                              setState(() {
                                                catname = value;
                                              });
                                            },
                                            validator: (value) =>
                                                (value!.isEmpty)
                                                    ? "Enter your name"
                                                    : null,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller: typecontroller,
                                            decoration:  InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "${data[index].categoryType}",
                                            ),
                                            onSaved: (value) {
                                              setState(() {
                                                cattype = value;
                                              });
                                            },
                                            validator: (value) =>
                                                (value!.isEmpty)
                                                    ? "Enter category type"
                                                    : null,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller: pricecontroller,
                                            decoration:  InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "${data[index].categoryPrice}",
                                            ),
                                            onSaved: (value) {
                                              setState(() {
                                                catprice = int.tryParse(value!);
                                              });
                                            },
                                            validator: (value) =>
                                                (value!.isEmpty)
                                                    ? "Enter category price"
                                                    : null,
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () async {

                                          if (formkey.currentState!.validate()) {
                                            formkey.currentState!.save();
                                            CategoryModel category = CategoryModel(categoryName: catname!, categoryType: cattype!, categoryPrice: catprice!,categoryId: data[index].categoryId,);
                                            int res = await dbHelper.dbhelper.updatecategory(
                                              data:  category,
                                            );

                                            print(res);

                                            if (res >= 1) {
                                              Get.showSnackbar(GetSnackBar(
                                                title: "Successfully",
                                                message: "category if $res ",
                                                backgroundColor: Colors.green,
                                                duration: const Duration(seconds: 3),

                                              ));
                                            }else{
                                              Get.showSnackbar(GetSnackBar(
                                                title: "UNSuccessfully",
                                                message: "category if $res ",
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 3),
                                              ));
                                            }

                                            namecontroller.clear();
                                            typecontroller.clear();
                                            pricecontroller.clear();
                                            setState(() {
                                              catname = null;
                                              cattype = null;
                                              catprice = null;
                                            });
                                          }

                                        },
                                        child: Text("Save"),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text("back"),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

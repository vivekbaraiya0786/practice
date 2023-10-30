import 'package:flutter/material.dart';
import 'package:techinal_practice/Modals/database/category_modal.dart';
import 'package:techinal_practice/helper/database/db_helper.dart';
import 'package:get/get.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
        title: const Text("DATABASE"),
        actions: [
          IconButton(onPressed: () {
            Get.toNamed("/fetchdata");
          }, icon: Icon(Icons.data_array))
        ],
      ),
      body: Form(
        key: formkey,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter category name",
                ),
                onSaved: (value) {
                  setState(() {
                    catname = value;
                  });
                },
                validator: (value) =>
                (value!.isEmpty) ? "Enter your name" : null,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: typecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter cat type",
                ),
                onSaved: (value) {
                  setState(() {
                    cattype = value;
                  });
                },
                validator: (value) =>
                (value!.isEmpty) ? "Enter category type" : null,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: pricecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter cat price",
                ),
                onSaved: (value) {
                  setState(() {
                    catprice = int.tryParse(value!);
                  });
                },
                validator: (value) =>
                (value!.isEmpty) ? "Enter category price" : null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            CategoryModel categoryModel = CategoryModel(categoryName: catname!,
                categoryType: cattype!,
                categoryPrice: catprice!);
            int res = await dbHelper.dbhelper.insertCategory(
              data: categoryModel,
            );

            print(res);

            if (res >= 1) {
              Get.showSnackbar(GetSnackBar(
                title: "Successfully",
                message: "category if $res ",
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              ));
            } else {
              Get.showSnackbar(GetSnackBar(
                title: "unSuccessfully",
                message: "category if $res ",
                backgroundColor: Colors.red,
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

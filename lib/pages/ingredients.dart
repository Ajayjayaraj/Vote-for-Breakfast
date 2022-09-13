import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project/utils/global.dart';
import 'package:project/utils/styles.dart';

class Ingredient extends StatefulWidget {
  const Ingredient({super.key});

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  final TextEditingController _ingreController = TextEditingController();
  List<String> ingred = [];
  String temp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter the ingredients"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(23),
                child: Column(
                  children: [
                    TextField(
                        onChanged: ((value) => temp = value),
                        // controller: _ingreController,
                        style: inputstyle(),
                        decoration: inputdec("Ingredients", Icons.food_bank)),
                  ],
                ),
              ),
              MaterialButton(
                  color: Colors.cyan,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    setState(() {
                      if (temp != "") ingred.add(temp);
                    });
                  }),
              Container(
                height: 500,
                width: 500,
                child: ListView.builder(
                    itemCount: ingred.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          // trailing: const Text(
                          //   "GFG",
                          //   style: TextStyle(color: Colors.green, fontSize: 15),
                          // ),
                          title: Text(ingred[index]));
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          child: Icon(Icons.arrow_forward),
          backgroundColor: Colors.cyan,
          onPressed: () {
              flag = 1;
              Get.toNamed('/first');
          },
        ));
    // body: ListView.builder(
    //           itemCount: 5,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(
    //                 leading: const Icon(Icons.list),
    //                 trailing: const Text(
    //                   "GFG",
    //                   style: TextStyle(color: Colors.green, fontSize: 15),
    //                 ),
    //                 title: Text("List item $index"));
    //           }),
    // );
  }
}

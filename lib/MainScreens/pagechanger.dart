import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project/MainScreens/widgettree.dart';
import 'package:project/utils/global.dart';
import 'myapp.dart';

class Pagechanger extends StatefulWidget {
  const Pagechanger({super.key});

  @override
  State<Pagechanger> createState() => _PagechangerState();
}

class _PagechangerState extends State<Pagechanger> {
  int i = 0;
  late Widget wg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      i = 1;
      getDetails();
    }
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (i == 0)
      return MyApp();
    else {
      return Decider('/first');
    }
    ;
  }
}

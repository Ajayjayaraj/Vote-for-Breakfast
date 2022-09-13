import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/pages/ingredients.dart';
import '../pages/First Page/firstpage.dart';
import '../pages/Registration/Login.dart';
import '../pages/Registration/registration.dart';

Widget Decider(String page) {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: page,
    getPages: [
      GetPage(name: '/login', page: () => LoginPage()),
      GetPage(name: '/register', page: () => RegistrationPage()),
      GetPage(name: '/first', page: () => FirstPage()),
      GetPage(name: '/ingre', page: () => Ingredient()),
    ],
  );
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/MainScreens/pagechanger.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Pagechanger(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Icon(Icons.food_bank,
              size: MediaQuery.of(context).size.height * 0.15),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          // Text(
          //   "Authentication",
          //   style:
          //       TextStyle(fontSize: MediaQuery.of(context).size.width * 0.08),
          // ),

          // Image(image: AssetImage("images/logo2.png"),),
          // Text("League El"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          SpinKitPouringHourGlassRefined(
            color: Colors.amber,
            size: 80.0,
          )
        ],
      ),
    ));
  }
}

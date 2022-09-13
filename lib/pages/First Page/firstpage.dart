import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:project/utils/global.dart';
import 'package:project/utils/piechart.dart';
import 'package:project/utils/styles.dart';

int count = 0;
List<int> arr = [0, 0, 0, 0, 0];

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String cameraScanResult = "k";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  int _selectedIndex = 0;

  double padding_length = 10;

  Widget buttonTile(String text, String route) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06),
      child: MaterialButton(
        color: pickColor(), //Color(0xffff2d55),
        elevation: 0,
        minWidth: 150,
        height: 50,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(padding_length)),
        child: Text(
          "$text",
          style: TextStyle(fontSize: padding_length),
        ),
        onPressed: () {
          Get.toNamed('$route');
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int randInt() {
    var random = Random();
    int k = random.nextInt(5);
    return k;
  }

  Color pickColor() {
    int count = 0;
    final colorList = [
      Colors.grey,
      Color(0xfffa9881),
      Color(0xff71b4fb),
      Color(0xffb1a5f6),
      Color(0xff71b4fb),
    ];
    for (int i = 0; i < 5; i++) {
      if (arr[i] == 1) {
        count++;
      }
    }
    if (count == 5) {
      for (int i = 0; i < 5; i++) {
        arr[i] = 0;
      }
    }
    int k = randInt();
    while (arr[k] != 0) {
      k = randInt();
    }
    arr[k] = 1;
    return colorList[k];
  }

  Widget buttonTile2(String text, Color col) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width *
              0.06), //MediaQuery.of(context).size.width * 0.1,
      child: MaterialButton(
        color: col, //Color(0xffff2d55),
        elevation: 0,
        minWidth: 150,
        height: 150,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          "$text",
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.grey)),
              Text("${Cuser.name}",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                        // controller: _nameControllerStudent,
                        style: inputstyle(),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    new BorderSide(color: Colors.black)),
                            focusedBorder: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: new BorderSide(color: Colors.cyan)),
                            enabledBorder: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    new BorderSide(color: Colors.black)),
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 16, // or whatever
                              color: Colors.grey,
                              height:
                                  2.2, //                                <----- this was the key
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(0),
                            isDense: true,
                            hintText: "Search")),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[100],
                        ),
                        // color: Colors.blue[200],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Have something",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "to cook?",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  MaterialButton(
                                    color: Colors.cyan,
                                    onPressed: () {
                                      Get.toNamed('/ingre');
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "Fill in the ingredients",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              Image.asset(
                                'images/abc.png',
                                height: 150,
                                width: 150,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    flag == 1
                        ? Container(
                            width: 400,
                            height: 270,
                            child: PieChartSample2(),
                          )
                        : SizedBox(
                            height: 0,
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Vote here",
              style: TextStyle(
                fontSize: 30,
               fontWeight: FontWeight.bold, 
              ),

            ),
            SizedBox(
              height: 110,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonTile2(
                  "Dosa",
                  Color(0xfffa9881),
                ),
                buttonTile2(
                  "Idli",
                  Color(0xff71b4fb),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonTile2(
                  "Uzhunnuvada",
                  Color(0xffb1a5f6),
                ),
                buttonTile2(
                  "Masala Dosa",
                  Colors.grey,
                ),
              ],
            ),
          ],
        ),
      )),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          leading: const Icon(
            Icons.short_text,
            size: 30,
            color: Colors.black,
          ),
          actions: [
            IconButton(
                color: Colors.black,
                onPressed: (() {
                  setState(() {
                    Get.toNamed('/login');
                    FirebaseAuth.instance.signOut();
                  });
                }),
                icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Stack(children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("Hello,",
              //             style: TextStyle(
              //                 fontSize:
              //                     MediaQuery.of(context).size.width * 0.06,
              //                 color: Colors.grey)),
              //         Text("${Cuser.name}",
              //             style: TextStyle(
              //               fontSize: MediaQuery.of(context).size.width * 0.1,
              //               fontWeight: FontWeight.bold,
              //             )),
              //       ],
              //     ),
              //   ),
              // ),
              _widgetOptions.elementAt(_selectedIndex),
            ])),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.poll_outlined),
              label: 'Create Poll',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Vote',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/utils/global.dart';
import 'package:project/utils/styles.dart';

ResetPassword(
        var context, TextEditingController email, FirebaseAuth firebaseAuth) =>
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        elevation: 3,
        title: Text(
          "Forget Password",
          textAlign: TextAlign.left,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text('Enter the Email ID'),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: email,
                  style: inputstyle(),
                  decoration: inputdec("email id", Icons.person_outline)),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  try {
                    print("object");
                    await firebaseAuth.sendPasswordResetEmail(
                        email: email.text);
                    restsender = 1;
                    print("00");
                    Navigator.of(ctx).pop();
                  } catch (e) {
                    restsender = 0;
                    print(e);
                  }
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.cyan, //Color(0xffff2d55),
                elevation: 0,
                minWidth: 100,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
      ),
    );

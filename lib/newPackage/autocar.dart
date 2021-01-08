import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/loginScreen.dart';

import '../DateTime.dart';

class AutoCar extends StatefulWidget {
  @override
  _AutoCarState createState() => _AutoCarState();
}

class _AutoCarState extends State<AutoCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'The EnD',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75), color: Colors.grey),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Sign-Out',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  width: 140,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DateandTime()));
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

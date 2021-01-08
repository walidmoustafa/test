import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/loginScreen.dart';
class verifyScreen extends StatefulWidget {
  @override
  _verifyScreenState createState() => _verifyScreenState();
}

class _verifyScreenState extends State<verifyScreen> {
  final auth = FirebaseAuth.instance;
  User user ;
  Timer timer ;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();

    });
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          title: Text('Verification'),
          centerTitle: true,
        ),
        backgroundColor: Colors.amberAccent,
        body: Container(

          margin: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45)
          ),
          child: Center(
            child: Text('An email has been sent to ${user.email}  please verify',style: TextStyle(fontSize: 25),),
          ),
        )
    );
  }
  Future<void> checkEmailVerified () async{
    user =auth.currentUser;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
    }

  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fristprogectin2021/loginScreen.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Reset Password'),
      ),
      body: Builder(
          builder: (context) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 8,right: 8),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Enter Your Email'),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)),
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                        padding: EdgeInsets.only(left: 95, right: 95),
                        child: Text('Send Request'),
                        onPressed: () {
                          auth.sendPasswordResetEmail(email: _email);
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Text('Check your Email Please  '),
                              title: Text('Data sent'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                                    },
                                    child: Text('Ok')),
                              ],
                            ),
                          );
                          //Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              )),
    );
  }
}

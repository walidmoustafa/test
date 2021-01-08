import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/DateTime.dart';
import 'package:fristprogectin2021/resetPassword.dart';
import 'Registration.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showpassword = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();

    super.dispose();
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // final _auth = FirebaseAuth.instance;
  // login

  bool box = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
              key: formkey,
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'logo',
                        child: Image.asset(
                            'assets/images/ferrari_spider_488_0.png')),
                    SizedBox(
                      height: 55,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your E_mail'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz enter your Email ... ';
                        }
                      },
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: showpassword,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showpassword = !showpassword;
                              });
                            },
                            child: Icon(showpassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your Password'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Fill Password Input';
                        } else if (val.length < 5) {
                          return 'Plz Enter Password at least 4';
                        }
                      },
                      controller: _passwordController,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 1, left: 5),
                        child: Row(children: [
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              activeColor: Colors.amber,
                              value: box,
                              onChanged: (val) {
                                setState(() {
                                  box = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ])),
                    SizedBox(
                      height: 2,
                    ),
                    Builder(
                        builder: (context) => RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              textColor: Colors.black,
                              color: Colors.deepOrange,
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: Text(
                                'Log-In',
                                style: TextStyle(fontSize: 30),
                              ),
                              onPressed: () async {
                                if (formkey.currentState.validate()) {
                                  try {
                                    var result = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);

                                    if (result != null) {
                                      // pushReplacement
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DateandTime()),
                                      );
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.deepOrange,
                                        content: Text('User not found')));
                                    //print(e.toString());
                                  }
                                }
                              },
                            )),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account ? ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        GestureDetector(
                          child: Text(
                            'Registration',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Registration()));
                          },
                        )
                      ],
                    ),SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ResetScreen()));
                          },
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      )

      ///////
      ,
      backgroundColor: Colors.amber,
    );
  }
}

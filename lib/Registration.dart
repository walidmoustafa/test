import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/loginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fristprogectin2021/verifiied.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool password = true;

  GlobalKey<FormState> dataRegist = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    _mobileController.dispose();

    super.dispose();
  }

  // register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70))),
        title: Text(
          'Registration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black38,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
              key: dataRegist,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                            //       borderSide: BorderSide(
                            //      color: Colors.yellowAccent, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            //   borderSide:
                            //    BorderSide(color: Colors.blue, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Enter Your Name'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz enter your Name ... ';
                        }
                      },
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //    color: Colors.yellowAccent, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            //     borderSide:
                            //      BorderSide(color: Colors.blue, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Plz Enter Your E_mail'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz enter your Email ... ';
                        }
                      },
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: password,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            child: Icon(password
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                          enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //      color: Colors.yellowAccent, width: 3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            //   borderSide:
                            //    BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(20),
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
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mobile_screen_share),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Colors.yellowAccent, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            // borderSide:
                            //  BorderSide(color: Colors.blue, width: 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Enter Your Mobile'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz Write Mobile ... ';
                        }
                      },
                      controller: _mobileController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   color: Colors.yellowAccent, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            // borderSide:
                            //  BorderSide(color: Colors.blue, width: 0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Enter Your Country'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz Write Country ... ';
                        }
                      },
                      controller: _countryController,
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    Builder(
                        builder: (context) => FlatButton(
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              textColor: Colors.black,
                              height: 30,
                              padding: EdgeInsets.only(left: 80, right: 80),
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    fontSize: 30, fontStyle: FontStyle.italic),
                              ),
                              onPressed: () async {
                                final dataform = dataRegist.currentState;
                                if (dataform.validate()) {
                                  try {
                                    var result = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);

                                    if (result != null) {
                                      // pushReplacement
                                      // ignore: deprecated_member_use
                                      Firestore.instance
                                          .collection('users')
                                          .document()
                                          .setData({
                                        'name': _nameController.text,
                                        'mobile': _mobileController.text,
                                        'country': _countryController.text
                                      });
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                verifyScreen()),
                                      );
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.deepOrange,
                                           shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.only(
                                               topRight: Radius.circular(70),topLeft:  Radius.circular(70)
                                             )
                                           ),
                                          content: Text(
                                              'The email address is badly formatted.')),
                                    );
                                  }
                                }
                              },
                            )),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account?   ',
                          style: TextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
      backgroundColor: Colors.amber,
    );
  }
}

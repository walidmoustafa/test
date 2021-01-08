import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContact extends StatefulWidget {
  @override
  _HomeContactState createState() => _HomeContactState();
}

class _HomeContactState extends State<HomeContact> {
  link() async {
    const url = 'https://gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _subject = TextEditingController();

  GlobalKey<FormState> datastate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70))),
        title: Text(
          'Contact Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
              key: datastate,
              child: Container(
                padding: EdgeInsets.only(top: 35, right: 15, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your Name',
                          labelText: 'Your Name',
                          suffixIcon: Icon(Icons.person)),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz enter your Name ... ';
                        }
                      },
                      controller: _name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your City',
                          labelText: 'Your City',
                          suffixIcon: Icon(Icons.home_outlined)),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Plz enter your City ... ';
                        }
                      },
                      controller: _city,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your Email',
                          labelText: 'Your Email',
                          suffixIcon: Icon(Icons.email)),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Fill Email Input';
                        }
                      },
                      controller: _email,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter Your Mobile',
                          labelText: 'Your Mobil',
                          suffixIcon: Icon(Icons.add_ic_call)),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Fill Mobile Input';
                        }
                      },
                      controller: _mobile,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter Your Subject',
                        labelText: 'Your Subject',
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Fill Mobile Input';
                        }
                      },
                      controller: _subject,
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    Builder(builder: (BuildContext context) {
                      return RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)),
                        color: Colors.deepOrange,
                        textColor: Colors.black,
                        padding: EdgeInsets.only(left: 95, right: 95),
                        child: Text(
                          'Sent',
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {
                          if (datastate.currentState.validate()) {
                            // ignore: deprecated_member_use
                            var consinfo = Firestore.instance
                                .collection('contacts')
                                // ignore: deprecated_member_use
                                .document()
                                // ignore: deprecated_member_use
                                .setData({
                              'name': _name.text,
                              'email': _email.text,
                              'mobile': _mobile.text,
                              'City': _city.text,
                              'Subject': _subject.text
                            });
                            showDialog(

                              context: context ,
                              builder: (_) =>AlertDialog(
                                content: Text('We will contact you ... '),
                                title: Text('Data sent'),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed('FristPageHome');
                                      },
                                      child: Text('Ok')),
                                ],
                              ) ,
                            );
                          }
                        },
                      );
                    }),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.only(left: 25, top: 25),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Details ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'You may contact us in writing at the following address',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email:  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          onTap: link,
                          child: Text('Gmail.com',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.lightBlue)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tel:  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text('+3530965000559595')
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Fax:  ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text('+35309066275244')
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: Colors.amber,
    );
  }
}

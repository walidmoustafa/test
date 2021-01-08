import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/BuildCars.dart';

class DateandTime extends StatefulWidget {
  @override
  _DateandTimeState createState() => _DateandTimeState();
}

class _DateandTimeState extends State<DateandTime> {
  GlobalKey<FormState> globalkey = GlobalKey<FormState>();
  TextEditingController _location = TextEditingController();
  String Location;

  TimeOfDay time1 = TimeOfDay.now();
  Future<Null> _SelectedTime1(BuildContext context) async {
    TimeOfDay pickedtime =
        await showTimePicker(context: context, initialTime: time1);
    if (pickedtime != null && pickedtime != time1) {
      setState(() {
        time1 =  pickedtime  ;
      });
    }
  }
  TimeOfDay time2 = TimeOfDay.now();
  Future<Null> _SelectedTime2(BuildContext context) async {
    TimeOfDay pickedtime2 =
        await showTimePicker(context: context, initialTime: time2, );
    if (pickedtime2 != null && pickedtime2 != time2) {
      setState(() {
        time2= pickedtime2 ;
      });
    }
  }
  DateTime pickedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
      // selectableDayPredicate:(DateTime val) => val.weekday == 6 || val.weekday == 7 ? false : true ,
      initialDatePickerMode: DatePickerMode.day,
      textDirection: TextDirection.rtl,
    );

    if (date != null && date != pickedDate) {
      setState(() {
        pickedDate = date;
      });
    }
  }
  DateTime pickedDate2 = DateTime.now();
  Future<Null> _selectDate2(BuildContext context) async {
    final DateTime date2 = await showDatePicker(
      context: context,
      initialDate: pickedDate2,
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
      // selectableDayPredicate:(DateTime val) => val.weekday == 6 || val.weekday == 7 ? false : true ,
      initialDatePickerMode: DatePickerMode.year,
      textDirection: TextDirection.rtl,
    );

    if (date2 != null && date2 != pickedDate2) {
      setState(() {
        pickedDate2 = date2;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
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
            'Booking',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,

        ),
        body: Form(
            key: globalkey,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                              child: FlatButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Text(
                                  'Pick-Up',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                              child: FlatButton(
                                onPressed: () {
                                  _selectDate2(context);
                                },
                                child: Text(
                                  'Drop-off',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                              child: FlatButton(
                                onPressed: () {
                                  _SelectedTime1(context);
                                },
                                child: Text(
                                  'Time-Up',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 140,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30)),
                              child: FlatButton(
                                onPressed: () {
                                       _SelectedTime2(context);
                                },
                                child: Text(
                                  'Time-off',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 27),
                              child: Text(
                                'Starting:  ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                '${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                '${time1.hour} : ${time1.minute}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 28),
                              child: Text(
                                'Endding:  ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                '${pickedDate2.day} / ${pickedDate2.month} / ${pickedDate2.year}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                '${time2.hour} : ${time2.minute}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'Location:  ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 28),
                            ),
                            Container(
                              child: Text(
                                '${Location} ',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              margin: EdgeInsets.only(left: 28),
                            ),
                          ],
                        )
                      ]),
                  //   child:
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Plz enter your Locatin ... ';
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                              filled: false,
                              labelText: 'Location',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              suffixIcon: Icon(
                                Icons.location_city_rounded,
                              ),
                              fillColor: Colors.amber[200]),
                          autofocus: false,
                          controller: _location,
                          onChanged: (val) {
                            setState(() {
                              Location = _location.text;
                            });
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      if (globalkey.currentState.validate()) {
                        // ignore: deprecated_member_use
                        var consinfo = Firestore.instance
                            .collection('DateTimeLocation')
                            // ignore: deprecated_member_use
                            .document()
                            // ignore: deprecated_member_use
                            .setData({
                          'Location': _location.text,
                          'Day up' : pickedDate,
                          'Day off' : pickedDate2

                            });

                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.amber[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            content: Text('Are you sure ... '),
                            title: Text(
                              'Alarm',
                              style: TextStyle(color: Colors.amber),
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('cancel')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Bookcar()),
                                    );
                                  },
                                  child: Text('Ok')),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Lets Go ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )));
  }
}

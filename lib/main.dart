import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/DateTime.dart';
import 'package:fristprogectin2021/FristPageHome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fristprogectin2021/BuildCars.dart';
import 'package:fristprogectin2021/HomeContact.dart';
import 'Registration.dart';
import 'loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(), ),
     // home: News(),
      initialRoute: 'FristPageHome',
      routes: {
        'Login': (context) => LoginScreen(),
        'BookCar': (context) => Bookcar(),
        'Registration': (context) => Registration(),
        '/': (context) => HomeContact(),
        'FristPageHome' : (context)=>FristPage(),
        'DateTime' : (context)=>DateandTime(),
      },
    );
  }
}

import 'package:flutter/material.dart';

class FristPage extends StatefulWidget {
  @override
  _FristPageState createState() => _FristPageState();
}

class _FristPageState extends State<FristPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Stack(
          children: [
            Positioned(
                top: 250,
                right: 80,
                left: 80,
                child:
            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45)),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('Login');
                },child: Text(
                'Lets Go',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              ),
            )),
            Positioned(
                top: 350,
                right: 80,
                left: 80,
                child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45)),
                    child: FlatButton(
                      onPressed: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeContact()));
                        Navigator.of(context).pushNamed('/');
                      },
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    )
                )),
            Positioned(
              top: 450,
              right: 20,
              left: 20,
              child: Image.asset('assets/images/nissan_gtr_1.png'),
            )
          ],
        ));
  }
}

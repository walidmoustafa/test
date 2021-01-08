import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fristprogectin2021/Cars.dart';


class Bookcar extends StatefulWidget {
  @override
  _BookcarState createState() => _BookcarState();
}

class _BookcarState extends State<Bookcar> {
  ////////////

  ///////////
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
          'Choose A Car',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black38,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOP DEALS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25),
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: ListView(children: [
                    Column(
                      children: [
                        _buildCars('assets/images/land_rover_0.png',
                            'Land Rover', 'Discovery', 'Price 2000'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/alfa_romeo_c4_0.png',
                            'Alfa Romeo', 'C4', 'Price 3580'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/nissan_gtr_0.png', 'Nissan',
                            'GTR', 'price 1100'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/acura_0.png', 'Acura',
                            'MDX 2020', 'price 2200'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/camaro_0.png', 'Chevrolet',
                            'Camaro', 'price 3400'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/ferrari_spider_488_0.png',
                            'Ferrari', 'Spider 488', 'price 4200'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/ford_0.png', 'Ford', 'Focus',
                            'price 2300'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/fiat_0.png', 'Fiat', '500x',
                            'price 1450'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/honda_0.png', 'Honda',
                            'Civic', 'price 900'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildCars('assets/images/citroen_0.png', 'Citroen',
                            'Picasso', 'price 1200'),
                      ],
                    )
                  ]),
                )
              ],
            )
          ],
        )
      ]),
    );
  }

  Widget _buildCars(String imagpath, String brand, String model, String price) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetialsCar(imagpath, brand, model, price)));
        },
        child: Wrap(
          //scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: imagpath,
                      child: Image(
                        image: AssetImage(imagpath),
                        fit: BoxFit.fitWidth,
                        height: 100,
                        width: 150,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brand,
                        style: TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),

            Divider(
              endIndent: 100,
              indent: 100,
              thickness: 7,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

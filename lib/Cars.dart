import 'package:flutter/material.dart';
import 'package:fristprogectin2021/newPackage/autocar.dart';
class DetialsCar extends StatefulWidget {
  final tagimage;
  final brand;
  final model;
  final price;


  DetialsCar(this.tagimage, this.brand, this.model, this.price);

  _DetialsCarState createState() => _DetialsCarState();
}

class _DetialsCarState extends State<DetialsCar> {
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
          'Details',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        actions: [

        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height -82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45)),
                    color: Colors.amber[200],
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width / 2) - 100,
                child: Hero(
                  tag: widget.tagimage,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.tagimage),
                            fit: BoxFit.cover)),
                  ),
                ),
                height: 150,
                width: 250,
              ),
              Positioned(
                right: 20,
                top: 300,
                left: 20,
                child: Container(
                  height: 80,
                  width: 400,
                  padding: EdgeInsets.only(
                    top: 8,
                    left: 16,
                  ),
                  margin: EdgeInsets.only(bottom: 16),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildSpecificationCar("Color", "White"),
                      buildSpecificationCar("Gearbox", "Automatic"),
                      buildSpecificationCar("Seat", "4"),
                      buildSpecificationCar("Motor", "v10 2.0"),
                      buildSpecificationCar("Speed (0-100)", "3.2 sec"),
                      buildSpecificationCar("Top Speed", "121 mph"),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 210,
                  left: 25,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 75,
                            child: Column(
                              children: [
                                Text(
                                  widget.brand,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                      ])),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
          height: 90,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12 Month",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "per month",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),SizedBox(width: 2,),
                    GestureDetector(
                      onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => AutoCar()));
                      },
                      child:Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ) ,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              "Book this car",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                    ))
                  ],
                ),
              ])),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

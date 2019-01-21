import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {

  final String cardHeading;
  final String subHeading;
  final String date;
  final double radialPercentage;

  const HomeList({this.cardHeading, this.subHeading, this.date, this.radialPercentage});

  Widget build(BuildContext) {
    return Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            child: Text(cardHeading,
            textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
        fontFamily: "openSans"),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            child: Text(subHeading,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  fontFamily: "openSans"),
            ),
          ),
          SizedBox(
          height: 45.0,
        width: 355.0,
      child: Container(
        width: 355,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromRGBO(138,156,167,.4), width: 1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
        ),
        child: Center(
          child: Text(date, textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w200),),
        ),
      ),
    ),
    SizedBox(
      child: Container(
        height:250,
        width: 355,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(138,156,167,.4), width: 1),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
        ),
        child: Align(
    alignment: Alignment.center,
          child: CircularProgressIndicator(
            value: radialPercentage,
          )//Text(" Compliant Logs\n\n Logs with HOS Violations\n\n Logs with Form & Manner Errors\n", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),),
        ),

      )
    ),
          
            ],
          );

  }
}
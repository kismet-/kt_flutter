import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 1,
            child: Text('\n\n    Log Audit Summary \n    View Logs\n',
            textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
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
          child: Text("JANUARY 5  -  JANUARY 19", textAlign: TextAlign.center, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w200),),
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
    alignment: Alignment.bottomLeft,
          child: Text(" Compliant Logs\n\n Logs with HOS Violations\n\n Logs with Form & Manner Errors\n", textAlign: TextAlign.left, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),),
        ),

      )
    ),
          
            ],
          );

  }
}
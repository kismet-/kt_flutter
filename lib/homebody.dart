import 'package:flutter/material.dart';
import 'package:kt_flutter/homelist.dart';

class HomeBody extends StatelessWidget{
  List <HomeList>cards = new List<HomeList>.generate(6, (i)=> new HomeList());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          //color: Color(0xf6f7f8),
            child: new ListView(
              children: cards,
            )
        )
    );
  }
}

//class HomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.start,
//      children: <Widget>[
//        Flexible(child: cards)
//      ],
//    );
//  }
//}

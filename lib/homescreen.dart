import 'package:flutter/material.dart';
import 'package:kt_flutter/homebody.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  final topBar = new AppBar(
    centerTitle: true,
    elevation: 1,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: new Image.asset('assets/icons/dropdownicon.png', width: 23,),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new HomeBody(),
      appBar: topBar,
        drawer: Drawer(
            child: Center(
              child: ListView(
                //color: 0xcce2ff,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: new Image.asset(
                      'assets/icons/KTlogo.png', width: 162.0,),
                  ),
                  Center(
                    child: ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
          )
    )
    );
  }
}
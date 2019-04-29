import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

BitmapDescriptor _markerIcon;

class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}


class DriversCard extends StatefulWidget {
  @override
  final Drivers drivers;

  DriversCard({@required this.drivers});

  State<StatefulWidget> createState() {
    return DriversCardState();
  }
}

class DriversCardState extends State<DriversCard>
    with AutomaticKeepAliveClientMixin<DriversCard> {
  bool get wantKeepAlive => true;


  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    void _updateBitmap(BitmapDescriptor bitmap) {
      setState(() {
        _markerIcon = bitmap;
      });
    }
    Future<void> _createMarkerImageFromAsset(BuildContext context) async {
      if (_markerIcon == null) {
        BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(10.0, 10.0)),
            'assets/icons/marker.png')
            .then(_updateBitmap);
      }
    }
    _createMarkerImageFromAsset(context);


    return Column(children: [
      // ---------------  Card Heading -----------------\\
      Align(
        alignment: Alignment.bottomLeft,
        heightFactor: 1,
        child: Text(
          '\n    Drivers',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 13.0,
              fontFamily: "openSans"),
        ),
      ),
      // ----------------  Card Subheading -----------------\\
      Align(
        alignment: Alignment.bottomLeft,
        heightFactor: 1,
        child: Text(
          '    View Drivers\n',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
              fontFamily: "openSans"),
        ),
      ),
      Container(
        height: 265,
        width: 355,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Color.fromRGBO(138, 156, 167, .4), width: 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4))),
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    widget.drivers.driverLocations[0].driverLocation.lat,
                    widget.drivers.driverLocations[0].driverLocation.lon),
                zoom: 7.4746,
              ),
              gestureRecognizers: Set()
                ..add(Factory<PanGestureRecognizer>(
                        () => PanGestureRecognizer()))..add(
                    Factory<ScaleGestureRecognizer>(
                            () => ScaleGestureRecognizer()))..add(
                    Factory<TapGestureRecognizer>(
                            () => TapGestureRecognizer()))..add(
                    Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
              markers: widget.drivers.driverLocations.map((driverLocations) =>
                  Marker(
                    markerId: MarkerId(
                        driverLocations.driverLocation.id.toString()),
                    icon: _markerIcon,
                    position: LatLng(
                        driverLocations.driverLocation.lat,
                        driverLocations.driverLocation.lon
                    ),
                    infoWindow: InfoWindow(
                      title: driverLocations.driverLocation.driver.firstName +
                          " " + driverLocations.driverLocation.driver.lastName,
                    ),
                  ),

              ).toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

            Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 12, top: 53),
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(2.0), topRight: Radius.circular(2.0), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
                      border: Border(top: BorderSide.none,
                          left: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide(color: HexToColor('#789299'),
                              width: .2,
                              style: BorderStyle.solid)),
                      color: Colors.white,
                      //boxShadow: BoxShadow()
                    ),
                    width: 86,
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 38,
                          height: 19,
                          decoration: BoxDecoration(
                              color: HexToColor('#428CD1'),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0))
                          ),
                          child: Center(child: Text("ON",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white),)),
                        ),
                        Text(widget.drivers.dutyStatusCount.onDuty.toString(),
                          style: TextStyle(fontSize: 10),)
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                            bottom: BorderSide(color: HexToColor('#789299'),
                                width: .2,
                                style: BorderStyle.solid)),
                        color: Colors.white
                    ),
                    width: 86,
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 38,
                          height: 19,
                          decoration: BoxDecoration(
                              color: HexToColor('#64B01A'),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0))
                          ),
                          child: Center(child: Text("D",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white),)),
                        ),
                        Text(widget.drivers.dutyStatusCount.driving.toString(),
                          style: TextStyle(fontSize: 10),)
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                            bottom: BorderSide(color: HexToColor('#789299'),
                                width: .2,
                                style: BorderStyle.solid)),
                        color: Colors.white
                    ),
                    width: 86,
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 38,
                          height: 19,
                          decoration: BoxDecoration(
                              color: HexToColor('#788c99'),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0))
                          ),
                          child: Center(
                              child: Text("SB",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),)),
                        ),
                        Text(widget.drivers.dutyStatusCount.sleeper.toString(),
                          style: TextStyle(fontSize: 10),)
                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                            bottom: BorderSide(color: HexToColor('#789299'),
                                width: .2,
                                style: BorderStyle.solid)),
                        color: Colors.white
                    ),
                    width: 86,
                    height: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 38,
                          height: 19,
                          decoration: BoxDecoration(
                              color: HexToColor('#788c99'),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4.0))
                          ),
                          child: Center(child: Text("OFF",
                            style: TextStyle(
                                fontSize: 10, color: Colors.white),)),
                        ),
                        Text(widget.drivers.dutyStatusCount.offDuty.toString(),
                          style: TextStyle(fontSize: 10),)
                      ],
                    )
                ),
              ],
            ),
            Positioned(
              //margin: EdgeInsets.only(left: 300, top: 200),
                top: 185,
                left: 315,
//            decoration: BoxDecoration(
//                border: Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide(color: HexToColor('#789299'), width: .2, style: BorderStyle.solid)),
//                color: Colors.white
//            ),
                width: 26,
                height: 63,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 26,
                      height: 29,
                      color: Colors.white,
                      child: Center(
                        child: Text("+",
                          style: TextStyle(fontSize: 22),),
                      ),
                    ),

                    Container(
                      width: 26,
                      height: 29,
                      color: Colors.white,
                      child: Center(
                        child: Text("-",
                            style: TextStyle(fontSize: 22)
                        ),
                      ),
                    )
                  ],
                )
            ),
            Positioned(
              //margin: EdgeInsets.only(left: 300, top: 200),
                top: 12,
                left: 315,
//            decoration: BoxDecoration(
//                border: Border(top: BorderSide.none, left: BorderSide.none, right: BorderSide.none, bottom: BorderSide(color: HexToColor('#789299'), width: .2, style: BorderStyle.solid)),
//                color: Colors.white
//            ),
                width: 30,
                height: 30,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.white,
                      child: Center(
                        child: Image.asset('assets/icons/max.png'),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    ]);
  }
}


import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

Services service = new Services();

class DriversCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DriversCardState();
  }
}

class DriversCardState extends State<DriversCard>
    with AutomaticKeepAliveClientMixin<DriversCard> {
  bool get wantKeepAlive => true;

  Future<Drivers> _drivers = service.getDrivers();

  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
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
      Stack(
        children: <Widget>[
          Center(
              child: Container(
            height: 265,
            width: 355,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4))),
            child: SizedBox(
              height: 70,
              width: 70,
              child: Stack(
                children: <Widget>[
                  FutureBuilder<Drivers>(
                      future: _drivers,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          double lat = snapshot
                              .data.driverLocations[0].driverLocation.lat;
                          double lon = snapshot
                              .data.driverLocations[0].driverLocation.lon;
                          return GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(lat, lon),
                              zoom: 7.4746,
                            ),
                            gestureRecognizers: Set()
                              ..add(Factory<PanGestureRecognizer>(
                                  () => PanGestureRecognizer()))
                              ..add(Factory<ScaleGestureRecognizer>(
                                  () => ScaleGestureRecognizer()))
                              ..add(Factory<TapGestureRecognizer>(
                                  () => TapGestureRecognizer()))
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                            markers: _markers,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);

                              _markers.add(Marker(
                                // This marker id can be anything that uniquely identifies each marker.
                                markerId: MarkerId(snapshot
                                    .data
                                    .driverLocations[0]
                                    .driverLocation
                                    .driver
                                    .firstName
                                    .toString()),
                                position: LatLng(lat, lon),
                                infoWindow: InfoWindow(
                                  title: snapshot.data.driverLocations[0]
                                          .driverLocation.driver.firstName +
                                      " " +
                                      snapshot.data.driverLocations[0]
                                          .driverLocation.driver.lastName,
                                ),
                                icon: BitmapDescriptor.defaultMarker,
                              ));

                              _markers.add(Marker(
                                // This marker id can be anything that uniquely identifies each marker.
                                markerId: MarkerId(snapshot
                                    .data
                                    .driverLocations[1]
                                    .driverLocation
                                    .driver
                                    .firstName
                                    .toString()),
                                position: LatLng(
                                    snapshot.data.driverLocations[1]
                                        .driverLocation.lat,
                                    snapshot.data.driverLocations[1]
                                        .driverLocation.lon),
                                infoWindow: InfoWindow(
                                  title: snapshot.data.driverLocations[1]
                                          .driverLocation.driver.firstName +
                                      " " +
                                      snapshot.data.driverLocations[1]
                                          .driverLocation.driver.lastName,
                                ),
                                icon: BitmapDescriptor.defaultMarker,
                              ));

                              _markers.add(Marker(
                                // This marker id can be anything that uniquely identifies each marker.
                                markerId: MarkerId(snapshot
                                    .data
                                    .driverLocations[2]
                                    .driverLocation
                                    .driver
                                    .firstName
                                    .toString()),
                                position: LatLng(
                                    snapshot.data.driverLocations[2]
                                        .driverLocation.lat,
                                    snapshot.data.driverLocations[2]
                                        .driverLocation.lon),
                                infoWindow: InfoWindow(
                                  title: snapshot.data.driverLocations[2]
                                          .driverLocation.driver.firstName +
                                      " " +
                                      snapshot.data.driverLocations[2]
                                          .driverLocation.driver.lastName,
                                ),
                                icon: BitmapDescriptor.defaultMarker,
                              ));
                            },
                          );
                        }
                      })
                ],
              ),
            ),
          ))
        ],
      ),
    ]);
  }
}

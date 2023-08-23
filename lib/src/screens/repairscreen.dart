import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapApp extends StatefulWidget {
  const MapApp({super.key});

  @override
  State<MapApp> createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  String address='';
  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Map'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(address),
            ),
            SizedBox(
              height: viewportHeight,
              child: OpenStreetMapSearchAndPick(
              center: LatLong(23, 89),
              onPicked: (pickedData) {
                setState(() {
                  address=pickedData.address;
                });
                 print(pickedData.latLong.latitude);
                 print(pickedData.latLong.longitude);
                 print(pickedData.address);
              }),
            )
          ],
        ),
      ),
    );
  }
}
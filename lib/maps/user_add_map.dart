import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import './map_snippet.dart';
import '../screens/report.dart';
// import 'package:geolocator/geolocator.dart';

class UserAddMap extends StatefulWidget {
  const UserAddMap({super.key});

  @override
  State<UserAddMap> createState() => _UserAddMapState();
}

class _UserAddMapState extends State<UserAddMap> {

  static const double _defaultlang =  5.590425;
  static const double _defaultlong = -0.202665;
  // late final GoogleMapController _googleMapController;
  static const CameraPosition _defaultlocation = CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 20);

  List <Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
            // onMapCreated: (controller) => _googleMapController = controller,
            initialCameraPosition: _defaultlocation,
            onTap: _handletap,
            //  mapType: _currentMapType,
             markers: Set.from(myMarker),
        ),
        floatingActionButton: ElevatedButton(
        onPressed: () { 
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple, backgroundColor: Colors.lightBlue),
        child: const Text(
          "Save location",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _handletap (LatLng tapedpoint) {
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
          markerId: MarkerId(tapedpoint.toString()),
          position: tapedpoint, 
          draggable: true,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        )
      );
    });
    // print(tapedpoint.toJson());
    selectedmap(true, tapedpoint);
  }
}
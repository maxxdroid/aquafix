// import 'package:aquafix/maps/user_add_map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';

class MapSnippet extends StatefulWidget {
  const MapSnippet({
    super.key,
  });

  @override
  State<MapSnippet> createState() => _MapSnipetState();
}

String check = '';

String locationPosition(Position pos) {
  return check;
}

LatLng? tapedpoint;
bool isSelected = false;


class _MapSnipetState extends State<MapSnippet> {
  static const double _defaultlang = 5.590425;
  static const double _defaultlong = -0.202665;
  late final GoogleMapController _googleMapController;
  static const CameraPosition _defaultlocation =
      CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 20);

  Future<Position> getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location disabled');
    }
    check = 'Getting coordinates please wait'; 
    setState(() {});

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission Denied");
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  @override
  void initState() {
    super.initState();
  }

  List<Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: (controller) => _googleMapController = controller,
            initialCameraPosition: _defaultlocation,
            // initialCameraPosition: CameraPosition(target: LatLng(widget.lat, widget.long)),
            onTap: (_) {
              Route route = MaterialPageRoute(builder: (c) => const MapSnippet());
              Navigator.push(context, route);
              print(tapedpoint.toString());
            },
            //  mapType: _currentMapType,
            markers: Set.from(myMarker),
          ),
          Positioned(
            child: Text(check),
            top: 1,
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
            label: const Text("My location"),
            onPressed: () async {
              Position position = await getUserLocation();
              print('...................${position.longitude}......');
              check = 'Coordinates Accessed';
              lat = position.latitude.toString();
              lng = position.longitude.toString();
              // post = position;
              locationSelected = true;
              // _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              //     CameraPosition( zoom: 14,
              //         target: LatLng(position.latitude, position.longitude))));
              _googleMapController.moveCamera(CameraUpdate.newCameraPosition(
                  CameraPosition( zoom: 14,
                      target: LatLng(position.latitude, position.longitude))));
              myMarker.clear();
              myMarker.add(Marker(
                  markerId: const MarkerId("Current Location"),
                  position: LatLng(position.latitude, position.longitude)));
              setState(() {});
            }),
      ),
    );
  }
}

Position ? post;
String? lat;
String? lng;
bool locationSelected = false;
// List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
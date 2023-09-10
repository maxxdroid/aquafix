import 'package:aquafix/maps/user_add_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapSnippet extends StatefulWidget {
  const MapSnippet({super.key});

  @override
  State<MapSnippet> createState() => _MapSnipetState();
}

LatLng ? tapedpoint;
bool isSelected = false;

selectedmap(bool tapped, LatLng newtapedpoint) {
  isSelected = tapped;
  tapedpoint = newtapedpoint;
}

class _MapSnipetState extends State<MapSnippet> {

  
  

  static const double _defaultlang =  5.590425;
  static const double _defaultlong = -0.202665;
  late final GoogleMapController _googleMapController;
  static const CameraPosition _defaultlocation = CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 16);

  List <Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      mapType: MapType.hybrid,
          onMapCreated: (controller) => _googleMapController = controller,
          initialCameraPosition:  isSelected ? CameraPosition(target: tapedpoint!): _defaultlocation,
          onTap: (_) {
            Route route =
                      MaterialPageRoute(builder: (c) => const UserAddMap());
                  Navigator.push(context, route);
            print(tapedpoint.toString());
          },
          //  mapType: _currentMapType,
           markers: Set.from(myMarker),
      );
  }
}

// List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
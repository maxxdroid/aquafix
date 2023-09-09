import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserAddMap extends StatefulWidget {
  const UserAddMap({super.key});

  @override
  State<UserAddMap> createState() => _UserAddMapState();
}

class _UserAddMapState extends State<UserAddMap> {
  static const double _defaultlang =  40.7128;
  static const double _defaultlong = -74.0060;
  late final GoogleMapController _googleMapController;
  static const CameraPosition _defaultlocation = CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 16);

  List <Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
          onMapCreated: (controller) => _googleMapController = controller,
          initialCameraPosition: _defaultlocation,
          // onTap: _handletap,
          //  mapType: _currentMapType,
           markers: Set.from(myMarker),
      );
  }
}
import 'package:aquafix/maps/user_add_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSnippet extends StatefulWidget {
  const MapSnippet({super.key});

  @override
  State<MapSnippet> createState() => _MapSnipetState();
}

class _MapSnipetState extends State<MapSnippet> {

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
          onTap: (_) {
            Route route =
                      MaterialPageRoute(builder: (c) => const UserAddMap());
                  Navigator.push(context, route);
          },
          //  mapType: _currentMapType,
           markers: Set.from(myMarker),
      );
  }
}
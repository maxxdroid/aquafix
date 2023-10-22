import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserViewMap extends StatefulWidget {
  final double lat;
  final double long;
  const UserViewMap({super.key, required this.lat, required this.long});

  @override
  State<UserViewMap> createState() => _UserViewMapState();
}

class _UserViewMapState extends State<UserViewMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: 15,
        ),
        markers: <Marker>{
          Marker(
              markerId: const MarkerId("Current Location"),
              position: LatLng(widget.lat, widget.long))
        });
  }
}

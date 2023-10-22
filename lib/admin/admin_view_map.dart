import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminViewMap extends StatefulWidget {
  final double lat;
  final double long;
  const AdminViewMap({super.key, required this.lat, required this.long});

  @override
  State<AdminViewMap> createState() => _AdminViewMap();
}

class _AdminViewMap extends State<AdminViewMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      mapToolbarEnabled: true,
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

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserAddMap extends StatefulWidget {
  const UserAddMap({super.key});

  @override
  State<UserAddMap> createState() => _UserAddMapState();
}

class _UserAddMapState extends State<UserAddMap> {
  static const double _defaultlang =  5.590425;
  static const double _defaultlong = -0.202665;
  late final GoogleMapController _googleMapController;
  static const CameraPosition _defaultlocation = CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 20);

  List <Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
          onMapCreated: (controller) => _googleMapController = controller,
          initialCameraPosition: _defaultlocation,
          onTap: _handletap,
          //  mapType: _currentMapType,
           markers: Set.from(myMarker),
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
    print(tapedpoint.toJson());
  }
}
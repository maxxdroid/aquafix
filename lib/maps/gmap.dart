import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FaultLocation extends StatefulWidget {
  const FaultLocation({super.key});

  @override
  State<FaultLocation> createState() => _FaultLocationState();
}

class _FaultLocationState extends State<FaultLocation> {
  static const double _defaultlang =  40.7128;
  static const double _defaultlong = -74.0060;
  static const CameraPosition _defaultlocation = CameraPosition(target: LatLng(_defaultlang, _defaultlong), zoom: 16);
  // ignore: unused_field
  late final GoogleMapController _googleMapController;
  MapType _currentMapType = MapType.normal;
  final Set<Marker> _markers = {};

  List <Marker> myMarker = [];

  _handletap (LatLng tapedpoint) {
    myMarker = [];
    myMarker.add(
      Marker(
        markerId: MarkerId(tapedpoint.toString()),
        position: tapedpoint
      ),
    );
  }

  void _changeMapType() {
    setState(() {
      _currentMapType =_currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("Default location"),
          position: _defaultlocation.target,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(
            title: "Fault Location",
            snippet: "",
          )
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) => _googleMapController = controller,
          initialCameraPosition: _defaultlocation,
          onTap: _handletap,
           mapType: _currentMapType, markers: Set.from(myMarker),),
        Container(
          padding: const EdgeInsets.only(top:24, right: 24),
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: _changeMapType,
                backgroundColor: Colors.green,
                child: const Icon(Icons.map, size: 30,)
                ),
                const SizedBox(
                  height:10
                ),
              FloatingActionButton(
                onPressed: _addMarker,
                backgroundColor: Colors.deepPurpleAccent,
                child: const Icon(Icons.add_location, size: 36,),
                )
            ],
          ),
        )
      ],
    );
  }
}
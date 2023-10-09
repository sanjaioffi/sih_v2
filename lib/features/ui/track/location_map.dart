import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late GoogleMapController mapController;
  final LatLng initialLocation =
      LatLng(10.365581, 77.970657); // Initial map location
  final Set<Marker> markers = Set<Marker>();

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: MarkerId('truckMarker'),
        position: initialLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        // You can use a custom icon by providing a BitmapDescriptor.fromAssetImage
        // icon: BitmapDescriptor.fromAsset('assets/truck_icon.png'),
        infoWindow: InfoWindow(
          title: 'Package Location',
          snippet: 'This is a custom truck icon.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: initialLocation,
        zoom: 14.0,
      ),
      markers: markers,
    );
  }
}

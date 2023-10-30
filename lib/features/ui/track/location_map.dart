import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late List<MarkerData> _customMarkers;
  final LatLng initialLocation = const LatLng(10.365581, 77.970657);

  Future<void> _createCustomMarkers() async {
    _addCustomMarkers();
  }

  void _addCustomMarkers() async {
    _customMarkers = [];
    _customMarkers.add(
      MarkerData(
        marker: Marker(
          markerId: const MarkerId(""),
          position: initialLocation,
          infoWindow: InfoWindow(
            title: "Current Location",
            snippet: "CheckPoint 1",
            onTap: () {},
          ),
        ),
        child: generateMarker(Icons.local_shipping_rounded, Colors.orange),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _createCustomMarkers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomGoogleMapMarkerBuilder(
          customMarkers: _customMarkers,
          builder: (BuildContext context, Set<Marker>? markers) {
            if (markers == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(10.390824, 77.596976),
                zoom: 8,
              ),
              markers: markers,
            );
          },
        ),
      ),
    );
  }

  generateMarker(IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
            radius: 15,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            )),
        const SizedBox(height: 1),
        CircleAvatar(
          radius: 2,
          backgroundColor: color,
        )
      ],
    );
  }
}

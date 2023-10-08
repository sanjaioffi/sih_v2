import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_v2/features/functions/functions.dart';

class DynamicMap extends StatefulWidget {
  const DynamicMap({
    super.key,
    required this.source,
    required this.destination,
    required this.centerPosition,
  });

  final LatLng source;
  final LatLng destination;
  final LatLng centerPosition;
  @override
  State<DynamicMap> createState() => _DynamicMapState();
}

class _DynamicMapState extends State<DynamicMap> {
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapAPI,
      PointLatLng(widget.source.latitude, widget.source.longitude),
      PointLatLng(widget.destination.latitude, widget.destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  //
  late Future<List<PointLatLng>> ponitLocation;
  late Polyline polyLine;
  @override
  void initState() {
    super.initState();
    _getPolyline();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomGesturesEnabled: true,
      compassEnabled: false,
      myLocationEnabled: false,
      zoomControlsEnabled: true,
      polylines: Set<Polyline>.of(polylines.values),
      markers: {
        Marker(
          markerId: const MarkerId("Source"),
          position: widget.source,
        ),
        Marker(
          markerId: const MarkerId("Destination"),
          position: widget.destination,
        )
      },
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
        target: widget.centerPosition,
        zoom: 6,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

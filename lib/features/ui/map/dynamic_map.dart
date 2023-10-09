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
    required this.zoomLevel,
    required this.isRoad,
  });

  final LatLng source;
  final LatLng destination;
  final LatLng centerPosition;
  final double zoomLevel;
  final bool isRoad;

  // State
  @override
  State<DynamicMap> createState() => _DynamicMapState();
}

class _DynamicMapState extends State<DynamicMap> {
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
      width: 2,
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  //
  late Future<List<PointLatLng>> ponitLocation;
  late Polyline polyLine;
  @override
  void initState() {
    super.initState();

    widget.isRoad
        ? _getPolyline()
        : const Polyline(polylineId: PolylineId("dewd"));
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      scrollGesturesEnabled: true,
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
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        )
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.centerPosition,
        zoom: widget.zoomLevel,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}

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

    widget.isRoad ? _getPolyline() : null;
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
      polylines: widget.isRoad
          ? Set<Polyline>.of(polylines.values)
          : {
              const Polyline(
                color: Colors.blue,
                zIndex: 9,
                polylineId: PolylineId("dewd"),
                points: <LatLng>[
                  LatLng(13.101576, 80.304451),
                  LatLng(14.313941, 81.432071),
                  LatLng(15.699641, 81.813045),
                  LatLng(17.393697, 84.510969),
                  LatLng(19.181565, 85.676800),
                  LatLng(20.037761, 86.549819),
                  LatLng(20.273953, 86.679643),
                ],
                jointType: JointType.mitered,
                patterns: [
                  PatternItem.dot,
                  PatternItem.dot,
                  PatternItem.dot,
                  PatternItem.dot,
                ],
                width: 2,
              )
            },
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

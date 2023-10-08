import 'package:flutter_polyline_points/flutter_polyline_points.dart';

final PolylinePoints polylinePoints = PolylinePoints();

const String googleMapAPI = "AIzaSyDW5yeFZjxFIaYkjb-ZlcE5SpSjt4z7u8g";

Future<List<PointLatLng>> getPolyPoints(
    double sourceLat, sourceLong, destLat, destLong) async {
  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    googleMapAPI,
    PointLatLng(sourceLat, sourceLong),
    PointLatLng(destLat, destLong),
  );
  return result.alternatives;
}

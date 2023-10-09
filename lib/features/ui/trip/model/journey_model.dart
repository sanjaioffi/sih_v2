// ignore_for_file: public_member_api_docs, sort_constructors_first
class JourneyModel {
  final double sourceLatitude;
  final double sourceLongitude;
  final double destinationLatitude;
  final double destinationLongitude;
  final bool isRoadWays;
  final int noOfTransport;
  final String sourceLocationName;
  final String destinationLocationName;
  final String timeOfRoundTrip;
  final String descriptionOfRoute;
  final double cameraPositionLatitude;
  final double cameraPositionLongitude;

  final double zoomLevel;

  JourneyModel({
    required this.sourceLatitude,
    required this.sourceLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.isRoadWays,
    required this.noOfTransport,
    required this.sourceLocationName,
    required this.destinationLocationName,
    required this.timeOfRoundTrip,
    required this.descriptionOfRoute,
    required this.cameraPositionLatitude,
    required this.cameraPositionLongitude,
    required this.zoomLevel,
  });
}

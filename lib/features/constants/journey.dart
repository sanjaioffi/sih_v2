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

List<List<JourneyModel>> journeyModels = [
  [
    JourneyModel(
      sourceLatitude: 11.535954,
      sourceLongitude: 79.469407,
      destinationLatitude: 13.083712,
      destinationLongitude: 80.294206,
      isRoadWays: true,
      noOfTransport: 10,
      sourceLocationName: "Neyveli Lignite Corpoation",
      destinationLocationName: "Chennai Horbor (TamilNadu)",
      timeOfRoundTrip: "30Hrs 2Mins",
      descriptionOfRoute: "NH36",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 6.5,
    ),
    JourneyModel(
      sourceLatitude: 13.083712,
      sourceLongitude: 80.294206,
      destinationLatitude: 20.281828,
      destinationLongitude: 86.673204,
      isRoadWays: false,
      noOfTransport: 1,
      sourceLocationName: "Chennai Horbor",
      destinationLocationName: "Paradip Port (Oddisha)",
      timeOfRoundTrip: "30Hrs 2Mins",
      descriptionOfRoute: "Nh36",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 4,
    ),
    JourneyModel(
      sourceLatitude: 20.281828,
      sourceLongitude: 86.673204,
      destinationLatitude: 20.291450,
      destinationLongitude: 85.818309,
      isRoadWays: true,
      noOfTransport: 10,
      sourceLocationName: "Paradip Port",
      destinationLocationName: "Bhubaneshwar",
      timeOfRoundTrip: "30Hrs 2Mins",
      descriptionOfRoute: "Nh36",
      cameraPositionLatitude: 20.982230,
      cameraPositionLongitude: 84.447458,
      zoomLevel: 6.5,
    ),
  ],

  // Complete Road Ways

  // The Neyveli to Chennai
  [
    JourneyModel(
      sourceLatitude: 11.535954,
      sourceLongitude: 79.469407,
      destinationLatitude: 13.091976,
      destinationLongitude: 80.275322,
      isRoadWays: true,
      noOfTransport: 10,
      sourceLocationName: "Neyveli Lignite Corpoation",
      destinationLocationName: "Chennai",
      timeOfRoundTrip: "4Hrs 15Mins",
      descriptionOfRoute: "NH132",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 6.5,
    ),

    // The Chennai to Vijaywada

    JourneyModel(
      sourceLatitude: 13.091976,
      sourceLongitude: 80.275322,
      destinationLatitude: 16.525217,
      destinationLongitude: 80.639061,
      isRoadWays: true,
      noOfTransport: 1,
      sourceLocationName: "Chennai",
      destinationLocationName: "Vijayawada(Andhra)",
      timeOfRoundTrip: "7Hrs 34Mins",
      descriptionOfRoute: "NH16",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 4.2,
    ),

    // Vijaywada to Vishakpatinam
    JourneyModel(
      sourceLatitude: 16.525217,
      sourceLongitude: 80.639061,
      destinationLatitude: 17.640745,
      destinationLongitude: 82.985157,
      isRoadWays: true,
      noOfTransport: 1,
      sourceLocationName: "Vijayawada",
      destinationLocationName: "Visakhapatnam(Andhra)",
      timeOfRoundTrip: "6Hrs 10Mins",
      descriptionOfRoute: "NH16",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 4.2,
    ),

    JourneyModel(
      sourceLatitude: 17.640745,
      sourceLongitude: 82.985157,
      destinationLatitude: 20.279493,
      destinationLongitude: 85.801200,
      isRoadWays: true,
      noOfTransport: 1,
      sourceLocationName: "Visakhapatnam",
      destinationLocationName: "Bhubaneswar",
      timeOfRoundTrip: "8Hrs 20Mins",
      descriptionOfRoute: "NH16",
      cameraPositionLatitude: 11.535954,
      cameraPositionLongitude: 79.469407,
      zoomLevel: 4.2,
    ),
  ],
];
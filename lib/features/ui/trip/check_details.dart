import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_v2/features/theme/span_styles.dart';
import 'package:sih_v2/features/ui/map/dynamic_map.dart';
import 'package:sih_v2/features/ui/trip/model/journey_model.dart';

class CheckPointDetails extends StatelessWidget {
  const CheckPointDetails({
    super.key,
    required this.journeyModel,
  });

  final JourneyModel journeyModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mini Map Screen
        Container(
          height: 300,
          color: Colors.grey.withOpacity(.2),
          child: DynamicMap(
            source: LatLng(
              journeyModel.sourceLatitude,
              journeyModel.sourceLongitude,
            ),
            destination: LatLng(
              journeyModel.destinationLatitude,
              journeyModel.destinationLongitude,
            ),
            centerPosition: LatLng(
              journeyModel.cameraPositionLatitude,
              journeyModel.cameraPositionLongitude,
            ),
            zoomLevel: journeyModel.zoomLevel,
            isRoad: journeyModel.isRoadWays,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          journeyModel.sourceLocationName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            journeyModel.isRoadWays ? const Text("20x ") : const SizedBox(),
            Icon(
              journeyModel.isRoadWays
                  ? Icons.local_shipping_outlined
                  : Icons.directions_boat_filled_rounded,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              journeyModel.destinationLocationName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 3,
            ),
          ],
        ),
        //
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: "via ",
            style: greyTextStyle,
            children: [
              TextSpan(
                  text: " ${journeyModel.descriptionOfRoute} ",
                  style: boldBlackTextStyle),
              TextSpan(text: "crossing ", style: greyTextStyle),
              TextSpan(text: "4x Toll", style: boldBlackTextStyle),
            ],
          ),
        ),
      ],
    );
  }
}

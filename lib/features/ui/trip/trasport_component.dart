import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/trip/custom_stepper.dart';
import 'package:sih_v2/features/ui/trip/model/journey_model.dart';

class TransportPlanComponent extends StatelessWidget {
  const TransportPlanComponent({
    super.key,
    required this.journeyModel,
    required this.routeNumber,
    required this.timeOfTravel,
  });

  final List<JourneyModel> journeyModel;
  final int routeNumber;
  final String timeOfTravel;

  @override
  Widget build(BuildContext context) {
    // Update It with a ListView.builder
    return Column(
      children: [
        ExpansionTile(
          tilePadding: const EdgeInsets.all(10),
          leading: const Icon(
            size: 25,
            Icons.local_shipping_outlined,
          ),
          title: Text(
            "Route $routeNumber",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5),
              Text(timeOfTravel),
            ],
          ),
          childrenPadding: const EdgeInsets.all(0),
          children: [
            CustomSteperWidget(
              journeyModel: journeyModel,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Divider(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sih_v2/features/constants/constants.dart';
import 'package:sih_v2/features/ui/trip/coal_transportation.dart';
import 'package:sih_v2/features/ui/trip/trasport_component.dart';
import 'package:sih_v2/features/ui/trip/trip_info.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  final List<String> a = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: const TripInfoTopBar(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CoalTransportDetails(),
            Expanded(
              child: ListView.builder(
                itemCount: journeyModels.length,
                itemBuilder: (context, index) {
                  return TransportPlanComponent(
                    routeNumber: index + 1,
                    timeOfTravel: "29H 3Min",
                    journeyModel: journeyModels[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


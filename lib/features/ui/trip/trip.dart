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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  final List<String> timings = ["3D:12 H", "1D:2 H"];
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Scaffold(
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
                          timeOfTravel: timings[index],
                          journeyModel: journeyModels[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(), // Loading indicator
            ),
          );
  }
}

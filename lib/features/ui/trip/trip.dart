import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/trip/trasport_component.dart';
import 'package:sih_v2/features/ui/trip/trip_info.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                ),
              ),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const TransportPlanComponent(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

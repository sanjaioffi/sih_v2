import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/track/location_map.dart';
import 'package:sih_v2/features/ui/track/stepper_page.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(flex: 2, child: LocationMap()),
            Flexible(flex: 1, child: StepperPage())
          ],
        ),
      ),
    ));
  }
}

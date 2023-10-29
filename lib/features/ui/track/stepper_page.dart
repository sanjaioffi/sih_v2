import 'package:flutter/material.dart';
import 'package:sih_v2/features/custom_packages/custom_package_tracker.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({Key? key}) : super(key: key);

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: OrderTracker(
          current: 1,
          activeColor: Colors.green,
          inActiveColor: Colors.grey[300],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sih_v2/features/functions/show_toast.dart';
import 'package:sih_v2/features/ui/trip/check_details.dart';
import 'package:sih_v2/features/ui/trip/model/journey_model.dart';

class CustomSteperWidget extends StatefulWidget {
  const CustomSteperWidget({
    super.key,
    required this.journeyData,
  });

  final List<JourneyModel> journeyData;

  @override
  State<CustomSteperWidget> createState() => _CustomSteperWidgetState();
}

class _CustomSteperWidgetState extends State<CustomSteperWidget> {
  int stepperIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, details) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton.filled(
              onPressed: () {
                stepperIndex == 0
                    ? showToast("No previous steps")
                    : setState(
                        () {
                          stepperIndex--;
                        },
                      );
              },
              icon: const Icon(Icons.arrow_upward),
            ),
            IconButton.filled(
              onPressed: () {
                stepperIndex == widget.journeyData.length - 1
                    ? showToast("last CheckPoint Reached")
                    : setState(() {
                        stepperIndex++;
                      });
              },
              icon: const Icon(Icons.arrow_downward),
            ),
          ],
        );
      },
      physics: const BouncingScrollPhysics(),
      onStepTapped: (value) async {
        setState(() {
          stepperIndex = value;
        });
      },
      currentStep: stepperIndex,
      connectorColor: const MaterialStatePropertyAll(Colors.blue),
      steps: [
        for (int idx = 0; idx < widget.journeyData.length; idx++)
          Step(
            title: Text("Checkpoint ${idx + 1}"),
            content: CheckPointDetails(
              journeyModel: widget.journeyData[idx],
            ),
          ),
      ],
    );
  }
}

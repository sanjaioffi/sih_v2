import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_v2/features/constants/constants.dart';
import 'package:sih_v2/features/ui/trip/check_details.dart';
import 'package:sih_v2/features/ui/trip/model/journey_model.dart';

class CustomSteperWidget extends StatefulWidget {
  const CustomSteperWidget({
    super.key,
    required this.journeyModel,
  });

  final List<JourneyModel> journeyModel;

  @override
  State<CustomSteperWidget> createState() => _CustomSteperWidgetState();
}

class _CustomSteperWidgetState extends State<CustomSteperWidget> {
  int stepperIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(
        "Info page. This is an information. You have : ${widget.journeyModel.length}");
    return Stepper(
      controlsBuilder: (context, details) {
        return const SizedBox();
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
        for (int idx = 0; idx < journeyModels.length + 1; idx++)
          Step(
            title: Text("Checkpoint ${idx + 1}"),
            content: CheckPointDetails(
              sourceLocationLatLng: LatLng(
                widget.journeyModel[idx].sourceLatitude,
                widget.journeyModel[idx].sourceLongitude,
              ),
              destinationLocationLatLng: LatLng(
                widget.journeyModel[idx].destinationLatitude,
                widget.journeyModel[idx].destinationLongitude,
              ),
              centerPositionLatLng: LatLng(
                widget.journeyModel[idx].cameraPositionLatitude,
                widget.journeyModel[idx].cameraPositionLongitude,
              ),
              zoomLevel: widget.journeyModel[idx].zoomLevel,
            ),
          ),
      ],
    );
  }
}

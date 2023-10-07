import 'package:flutter/material.dart';
import 'package:sih_v2/features/theme/span_styles.dart';

class TransportPlanComponent extends StatelessWidget {
  const TransportPlanComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ExpansionTile(
          tilePadding: EdgeInsets.all(10),
          leading: Icon(
            size: 25,
            Icons.local_shipping_outlined,
          ),
          title: Text(
            "Route I",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Text("29H 30M"),
            ],
          ),
          childrenPadding: EdgeInsets.all(0),
          children: [
            CustomSteperWidget(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Divider(),
        ),
      ],
    );
  }
}

class CustomSteperWidget extends StatefulWidget {
  const CustomSteperWidget({
    super.key,
  });

  @override
  State<CustomSteperWidget> createState() => _CustomSteperWidgetState();
}

class _CustomSteperWidgetState extends State<CustomSteperWidget> {
  int stepperIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controlsBuilder: (context, details) {
        return const SizedBox();
      },
      physics: const BouncingScrollPhysics(),
      onStepTapped: (value) {
        setState(() {
          stepperIndex = value;
        });
      },
      currentStep: stepperIndex,
      connectorColor: const MaterialStatePropertyAll(Colors.blue),
      steps: [
        Step(
          title: const Text("Checkpoint 1"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                color: Colors.grey.withOpacity(.2),
              ),
              const SizedBox(height: 10),
              const Text(
                "Neyveli Coal Corporation Limited",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text("20x "),
                  Icon(Icons.local_shipping_outlined),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "Chennai Port (5H & 3Min)",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
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
                    TextSpan(text: " NH47 ", style: boldBlackTextStyle),
                    TextSpan(text: "crossing ", style: greyTextStyle),
                    TextSpan(text: "4x Toll", style: boldBlackTextStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Step(title: Text("title"), content: Text("Hel")),
        const Step(title: Text("title"), content: Text("Hel")),
      ],
    );
  }
}

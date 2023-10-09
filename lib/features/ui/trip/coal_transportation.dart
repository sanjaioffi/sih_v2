import 'package:flutter/material.dart';

class CoalTransportDetails extends StatelessWidget {
  const CoalTransportDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text("UCTP ID - UCTP126172827"),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text("Transportation Initiates on 16/10/23"),
        ),
        const Divider(),
      ],
    );
  }
}

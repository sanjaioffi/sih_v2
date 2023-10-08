import 'package:flutter/material.dart';

class TripInfoTopBar extends StatelessWidget {
  const TripInfoTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Your Round Trip",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Neyveli",
                    style: TextStyle(color: Colors.red),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.black,
                  ),
                  Text(
                    "Oddisha",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

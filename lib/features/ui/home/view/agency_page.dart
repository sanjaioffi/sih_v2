import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/home/widgets/agecy_list.dart';

import 'package:sih_v2/features/ui/home/widgets/custom_title_widget.dart';

class AgencyPage extends StatelessWidget {
  const AgencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 15),
              const CustomTitleWidget(titleContent: "All Coal Agencies"),
              Expanded(
                child: AgencyList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GreetMessage(),
        Row(
          children: [
            Icon(Icons.search, color: Colors.black),
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://companieslogo.com/img/orig/NLCINDIA.NS-fdcb06f1.png?t=1604232066"),
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ],
    );
  }
}

class GreetMessage extends StatelessWidget {
  const GreetMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleWidget(titleContent: "Welcome NLC"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.orangeAccent,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Your Transportation is in progress",
                style: TextStyle(color: Colors.orange, fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}

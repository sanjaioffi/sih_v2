import 'package:flutter/material.dart';
import 'package:sih_v2/features/ui/analytics/widgets/a.dart';
import 'package:sih_v2/features/ui/analytics/widgets/linechart.dart';

import 'widgets/coal_agency_image_holder.dart';

class Analytic extends StatelessWidget {
  const Analytic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 1,
        scrolledUnderElevation: 0,
        title: const Text("Coal Analytics"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoalAgencyImageHolder(),
            AnalyticsBody(),
          ],
        ),
      ),
    );
  }
}

class AnalyticsBody extends StatelessWidget {
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Bicharpur Coal Mine",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(height: 15),
          Text(
            "The Bicharpur coal mine is an underground mine, operated by Ultra Tech Cement Limited, a cement manufacturer,  ",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(.5)),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              bottom: 18,
            ),
            child: Text(
              "Transport Data",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          wholeChartContainer(
              "Coal Export Operation",
              "40+",
              const LineChartWidget(
                color: Colors.blue,
              ),
              "↑ 12.9% ",
              Colors.blue),
          const SizedBox(
            height: 10,
          ),
          wholeChartContainer("Coal Production (Tons)", "1345T",
              const LineChartWidget(color: Colors.red), "↓ 4.9% ", Colors.red),
          const SizedBox(
            height: 10,
          ),
          wholeChartContainer(
              "Coal Transported",
              "45T",
              const LineChartWidget(
                color: Colors.blue,
              ),
              "↑ 56.9% ",
              Colors.blue),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

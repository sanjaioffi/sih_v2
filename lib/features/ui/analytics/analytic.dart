import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sih_v2/features/ui/analytics/widgets/bar_data.dart';
import 'package:sih_v2/features/ui/analytics/widgets/linechart.dart';
import 'package:sih_v2/features/ui/analytics/widgets/piechart.dart';

class Analytic extends StatelessWidget {
  const Analytic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {},
          splashRadius: 10.r,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          SizedBox(
            width: 70.w,
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Icon(Icons.emoji_events), Icon(Icons.circle)]),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            height: 1.h,
            color: Colors.grey[300],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30.w)),
                  child: Image.asset(
                    "assets/img/coal-ministry.jpg",
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Bicharpur Coal Mine",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "The Bicharpur coal mine is an underground mine, operated by Ultra Tech Cement Limited, a cement manufacturer,  ",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.5)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Transport Data",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              wholeChartContainer(
                  "Chats",
                  "1345",
                  LineChartWidget(
                    color: Colors.blue,
                  ),
                  "↑ 12.9% ",
                  Colors.blue),
              SizedBox(
                height: 10.h,
              ),
              wholeChartContainer("Chats", "1345",
                  LineChartWidget(color: Colors.red), "↓ 4.9% ", Colors.red),
              SizedBox(
                height: 10.h,
              ),
              wholeChartContainer(
                  "Chats",
                  "1345",
                  const LineChartWidget(
                    color: Colors.blue,
                  ),
                  "↑ 56.9% ",
                  Colors.blue),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container wholeChartContainer(
      String title, value, Widget chart, String percent, Color color) {
    return Container(
      // width: 450.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          chartColumnData(title, value, percent, color),
          SizedBox(
            height: 50.h,
            width: 135.w,
            child: chart,
          ),
        ],
      ),
    );
  }

  Column chartColumnData(String title, value, percent, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.5.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 28.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: percent,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w600, fontSize: 15.sp)),
          TextSpan(
              text: " last Month",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp))
        ]))
      ],
    );
  }

  Container chartBackground(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}

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
      appBar: AppBar(
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
              CircleAvatar(
                // backgroundColor: Colors.grey[300],
                // radius: 30.r,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30.r,
                ),
              ),
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
              chartBackground(BarChartWidget()),
              Text(
                "Other Data",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              chartBackground(const LineChartWidget()),
              const PieChartWidget()
            ],
          ),
        ),
      ),
    );
  }

  Container chartBackground(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.deepPurple[600],
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

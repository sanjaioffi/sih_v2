import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sih_v2/features/ui/analytics/widgets/chart_columns.dart';

Container wholeChartContainer(
    String title, value, Widget chart, String percent, Color color) {
  return Container(
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

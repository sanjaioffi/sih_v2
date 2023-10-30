import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        ]),
      )
    ],
  );
}

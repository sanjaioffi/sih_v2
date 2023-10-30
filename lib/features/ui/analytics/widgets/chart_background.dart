import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

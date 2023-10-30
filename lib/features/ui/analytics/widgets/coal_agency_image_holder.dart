import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoalAgencyImageHolder extends StatelessWidget {
  const CoalAgencyImageHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        fit: BoxFit.fill,
        "assets/img/coal-ministry.jpg",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Container(
            width: 220.w,
            child: Row(children: [Icon(Icons.emoji_events)]),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            // CircleAvatar(),
          ],
        ),
      ),
    );
  }
}

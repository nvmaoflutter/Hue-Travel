import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowTextWidget extends StatelessWidget {
  final String name;
  const RowTextWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 22.h,
          width: 4.w,
          decoration: BoxDecoration(
              color: const Color(0xFFFA4A0C),
              borderRadius: BorderRadius.circular(30)),
        ),
        SizedBox(width: 4.w, height: 0.0),
        Text(
          name,
          style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

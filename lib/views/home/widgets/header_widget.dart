import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../main.dart';
import '../../../storage/storage.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Huế Travel',
            style: TextStyle(fontSize: 22.spMin, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () {
              setState(() {
                final String? lang = Storage.getValue("language");
                if (lang == "vi") {
                  MyApp.setLocale(context, const Locale("en"));
                } else {
                  MyApp.setLocale(context, const Locale("vi"));
                }
              });
            },
            child: SvgPicture.asset(
                Storage.getValue("language") == "en"
                    ? "assets/images/england.svg"
                    : "assets/images/vietnam.svg",
                width: 25.w,
                height: 25.w),
          )
        ],
      ),
    );
  }
}

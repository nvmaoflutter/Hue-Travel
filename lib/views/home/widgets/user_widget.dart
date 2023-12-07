import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../languages/generated/l10n.dart';
import 'circle_image_widget.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: <Widget>[
          CircleImageWidget(
            width: 60.w,
            height: 60.w,
            url:
                "http://103.152.165.186:3005/static/default_avatar_be25b0e8-ccfc-489b-a83b-07a2470ac3cc.png",
          ),
          SizedBox(width: 8.w, height: 0.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).intro,
                  style: TextStyle(
                      fontSize: 16.spMin, fontWeight: FontWeight.w600),
                ),
                Text(
                  S.of(context).welcomeToApp,
                  style: TextStyle(
                      fontSize: 16.spMin, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../languages/generated/l10n.dart';

class TitleBottomSheet extends StatelessWidget {
  const TitleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox.shrink(),
          Text(
            S.of(context).detailShop,
            style: TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close, size: 22.spMin),
          )
        ],
      ),
    );
  }
}

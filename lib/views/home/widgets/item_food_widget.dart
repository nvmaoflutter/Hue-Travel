import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../languages/generated/l10n.dart';
import '../../../models/food_model.dart';
import 'circle_image_widget.dart';

class ItemFoodWidget extends StatelessWidget {
  final FoodModel model;
  const ItemFoodWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Container(
          width: 200.w,
          height: 220.h,
          margin: EdgeInsets.only(top: 60.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x19393939),
                blurRadius: 30,
                offset: Offset(0, 10),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  model.getName(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 0.0, height: 12.h),
              Text(
                '${model.shops?.length ?? 0} ${S.of(context).location}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFA4A0C),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 0.0, height: 48.h)
            ],
          ),
        ),
        CircleImageWidget(
          url: model.url,
        )
      ],
    );
  }
}

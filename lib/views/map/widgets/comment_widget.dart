import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/comment_model.dart';
import '../../home/widgets/circle_image_widget.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel? commentModel;
  const CommentWidget({super.key, this.commentModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleImageWidget(
          width: 45.w,
          height: 45.w,
          url: commentModel?.avatar,
        ),
        SizedBox(width: 8.w, height: 0.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                commentModel?.name ?? "",
                style:
                    TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 0.0, height: 4.h),
              Row(
                children: <Widget>[
                  for (int index = 0; index < 5; index++)
                    Icon(CupertinoIcons.star_fill,
                        color: (index < (commentModel?.star ?? 0))
                            ? Colors.yellow
                            : Colors.grey,
                        size: 12.spMin)
                ],
              ),
              SizedBox(width: 0.0, height: 4.h),
              Text(
                commentModel?.content ?? "",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}

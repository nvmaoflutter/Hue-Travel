import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vietnamfood/views/map/widgets/title_bottom_sheet.dart';

import '../../../languages/generated/l10n.dart';
import '../../../models/comment_model.dart';
import '../../../models/shop_model.dart';
import '../../home/widgets/circle_image_widget.dart';
import '../../home/widgets/row_text_widget.dart';
import 'comment_widget.dart';

class ShopDetailBottomSheet extends StatelessWidget {
  final ShopModel model;
  const ShopDetailBottomSheet({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      height: 0.95.sh,
      width: double.infinity,
      child: Column(
        children: [
          const TitleBottomSheet(),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 0.0, height: 16.h),
                        Text(
                          model.getName(),
                          style: TextStyle(
                              fontSize: 20.spMin, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 0.0, height: 8.h),
                        Text(
                          model.getSumary(),
                          style: TextStyle(
                              fontSize: 18.spMin, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 0.0, height: 16.h),
                        RowTextWidget(
                          name: S.of(context).image,
                        ),
                        SizedBox(width: 0.0, height: 16.h),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.w),
                          // itemCount: model.urls?.length ?? 0,
                          itemCount: model.urls?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final String? url = model.urls?[index];
                            return Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(url ??
                                          "https://d3design.vn/uploads/Anh_Bia_Food_menu_web_banner_social_media_banner_template_Free_Psd.jpg"))),
                            );
                          },
                        ),
                        SizedBox(width: 0.0, height: 36.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogWidget extends StatelessWidget {
  final String text;
  const CatalogWidget({
    super.key,
    required this.text,
  });

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
        SizedBox(width: 8.w, height: 0.0),
        Text(
          text,
          style: TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class RowInfomationWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const RowInfomationWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: const Color(0xFFB71C1C),
          size: 22.sp,
        ),
        SizedBox(width: 8.w, height: 0.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

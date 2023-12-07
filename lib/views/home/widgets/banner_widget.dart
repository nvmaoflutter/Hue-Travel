import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vietnamfood/models/news_model.dart';

import '../../../controllers/home_controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int indexPage = 0;
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<NewsModel>>(
        stream: homeController.newRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.requireData.docs;
            if (data.isNotEmpty) {
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 0.8,
                        height: 160.h,
                        autoPlay: true,
                        reverse: true,
                        onPageChanged: (page, CarouselPageChangedReason c) {
                          setState(() {
                            indexPage = page;
                          });
                        }),
                    items: _buildItem(data),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  SizedBox(
                    height: 8.h,
                    child: ListView.separated(
                      itemCount: data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 9.w, height: 0.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 8.h,
                          width: 8.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: indexPage == index
                                  ? const Color(0xFFF57F17)
                                  : const Color(0xFFF57F17).withOpacity(0.5)),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
          return const SizedBox.shrink();
        });
  }

  List<Widget> _buildItem(List<QueryDocumentSnapshot<NewsModel>> data) {
    final List<String> urls = [];
    for (var item in data) {
      final String? url = item.data().url;
      if (url != null) {
        urls.add(url);
      }
    }
    List<Widget> widgets = urls
        .map((item) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: item,
                  height: 160.h,
                  width: 0.9.sw,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 14.sp,
                  ),
                ),
              ),
            ))
        .toList();
    return widgets;
  }
}

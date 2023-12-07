import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vietnamfood/controllers/home_controller.dart';
import 'package:vietnamfood/languages/generated/l10n.dart';
import 'widgets/banner_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/list_event_widget.dart';
import 'widgets/list_food_widget.dart';
import 'widgets/row_text_widget.dart';
import 'widgets/user_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();
  @override
  void initState() {
    //homeController.pushData();
    homeController.determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Column(
        children: <Widget>[
          SizedBox(
              width: 0.0, height: MediaQuery.paddingOf(context).top + 16.h),
          const HeaderWidget(),
          const Divider(color: Colors.black38),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  SizedBox(width: 0.0, height: 24.h),
                  // const UserWidget(),
                  // SizedBox(width: 0.0, height: 32.h),
                  const BannerWidget(),
                  SizedBox(width: 0.0, height: 32.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RowTextWidget(
                        name: S.of(context).foodSpecial,
                      )),
                  SizedBox(width: 0.0, height: 32.h),
                  const ListFoodWidget(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RowTextWidget(
                        name: S.of(context).place,
                      )),
                  SizedBox(width: 0.0, height: 32.h),
                  ListEventWidget(
                    stream: homeController.placeRef.snapshots(),
                  ),
                  SizedBox(width: 0.0, height: 32.h),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RowTextWidget(
                        name: S.of(context).event,
                      )),
                  SizedBox(width: 0.0, height: 32.h),
                  ListEventWidget(
                    stream: homeController.eventRef.snapshots(),
                  ),
                  SizedBox(width: 0.0, height: 32.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

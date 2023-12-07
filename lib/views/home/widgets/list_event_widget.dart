import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vietnamfood/controllers/home_controller.dart';
import 'package:vietnamfood/models/event_model.dart';

import '../../map/map_food_view.dart';
import 'item_event.dart';

class ListEventWidget extends StatefulWidget {
  final Stream<QuerySnapshot<EventModel>> stream;
  const ListEventWidget({super.key, required this.stream});

  @override
  State<ListEventWidget> createState() => _ListEventWidgetState();
}

class _ListEventWidgetState extends State<ListEventWidget> {
  final HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<EventModel>>(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final QuerySnapshot<EventModel> data = snapshot.requireData;
            return SizedBox(
              height: 280.h,
              child: ListView.separated(
                itemCount: data.docs.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16.w, height: 0.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  final EventModel model = data.docs[index].data();
                  return InkWell(
                    onTap: () {
                      navigatorToScreen(context, model);
                    },
                    child: ItemEventWidget(model: model),
                  );
                },
              ),
            );
          }
          return const SizedBox(width: 0.0, height: 0.0);
        });
  }

  navigatorToScreen(context, EventModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapFoodView(
          name: model.getName(),
          shops: model.events ?? [],
        ),
      ),
    );
  }
}

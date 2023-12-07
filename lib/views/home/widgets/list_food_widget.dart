import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vietnamfood/controllers/home_controller.dart';

import '../../../models/food_model.dart';
import '../../map/map_food_view.dart';
import 'item_food_widget.dart';

class ListFoodWidget extends StatefulWidget {
  const ListFoodWidget({super.key});

  @override
  State<ListFoodWidget> createState() => _ListFoodWidgetState();
}

class _ListFoodWidgetState extends State<ListFoodWidget> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: StreamBuilder<QuerySnapshot<FoodModel>>(
          stream: homeController.foodRef.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot<FoodModel>> data =
                  snapshot.requireData.docs;
              return ListView.separated(
                itemCount: data.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16.w, height: 0.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  final FoodModel model = data[index].data();
                  return InkWell(
                    onTap: () {
                      navigatorToScreen(context, model);
                    },
                    child: ItemFoodWidget(
                      model: model,
                    ),
                  );
                },
              );
            }
            return const Center(
                child: CupertinoActivityIndicator(color: Colors.black));
          }),
    );
  }

  navigatorToScreen(context, FoodModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapFoodView(
          name: model.getName(),
          shops: model.shops ?? [],
          type: "food",
        ),
      ),
    );
  }
}

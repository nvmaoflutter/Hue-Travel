import 'package:vietnamfood/storage/storage.dart';

import 'shop_model.dart';

class FoodModel {
  final String? id;
  final String? url;
  final String? name;
  final String? nameEn;
  final List<ShopModel>? shops;

  FoodModel({this.id, this.name, this.nameEn, this.url, this.shops});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json["id"] as String?,
      name: json["name"] as String?,
      nameEn: json["nameEn"] as String?,
      url: json["url"] as String?,
      shops: (json["shops"] as List<dynamic>?)
          ?.map((item) => ShopModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
  String getName() {
    final String? language = Storage.getValue("language");
    if (language == "en") {
      return nameEn?.replaceAll("\\n", '\n') ?? "";
    }
    return name?.replaceAll("\\n", '\n') ?? "";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameEn": nameEn,
        "url": url,
        "shops": shops?.map((e) => e.toJson()).toList(),
      };
}

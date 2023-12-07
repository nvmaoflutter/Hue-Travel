import 'package:vietnamfood/models/shop_model.dart';

import '../storage/storage.dart';

class EventModel {
  final String? id;
  final String? name;
  final String? nameEn;
  final String? description;
  final String? descriptionEn;
  final String? thumbnail;
  final List<ShopModel>? events;

  EventModel(
      {this.id,
      this.name,
      this.nameEn,
      this.description,
      this.descriptionEn,
      this.thumbnail,
      this.events});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"] as String?,
      name: json["name"] as String?,
      nameEn: json["nameEn"] as String?,
      description: json["description"] as String?,
      descriptionEn: json["descriptionEn"] as String?,
      thumbnail: json["thumbnail"] as String?,
      events: (json["events"] as List<dynamic>?)
          ?.map((e) => ShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  String getName() {
    final String? language = Storage.getValue("language");
    if (language == "en") {
      return nameEn ?? "";
    }
    return name ?? "";
  }

  String getDescription() {
    final String? language = Storage.getValue("language");
    if (language == "en") {
      return descriptionEn?.replaceAll("\\n", '\n') ?? "";
    }
    return description?.replaceAll("\\n", '\n') ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "nameEn": nameEn,
      "description": description,
      "descriptionEn": descriptionEn,
      "thumbnail": thumbnail,
      "events": events?.map((e) => e.toJson()).toList(),
    };
  }
}

import '../storage/storage.dart';

class ShopModel {
  final String? id;
  final String? name;
  final String? nameEn;
  final String? summary;
  final String? summaryEn;
  final List<String>? urls;
  final double? latitude;
  final double? longitude;

  ShopModel(
      {this.id,
      this.name,
      this.nameEn,
      this.summary,
      this.summaryEn,
      this.urls,
      this.latitude,
      this.longitude});

  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
        id: json["id"] as String?,
        name: json["name"] as String?,
        nameEn: json["nameEn"] as String?,
        summary: json["summary"] as String?,
        summaryEn: json["summaryEn"] as String?,
        latitude: json["latitude"] as double?,
        longitude: json["longitude"] as double?,
        urls: json["urls"] != null ? List.from(json["urls"]) : null);
  }
  String getName() {
    final String? language = Storage.getValue("language");
    if (language == "en") {
      return nameEn?.replaceAll("\\n", '\n') ?? "";
    }
    return name?.replaceAll("\\n", '\n') ?? "";
  }

  String getSumary() {
    final String? language = Storage.getValue("language");
    if (language == "en") {
      return summaryEn?.replaceAll("\\n", '\n') ?? "";
    }
    return summary?.replaceAll("\\n", '\n') ?? "";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameEn": nameEn,
        "summary": summary,
        "summaryEn": summaryEn,
        "latitude": latitude,
        "longitude": longitude,
        "urls": urls
      };
}

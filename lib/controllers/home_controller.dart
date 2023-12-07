import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vietnamfood/models/comment_model.dart';
import 'package:vietnamfood/models/event_model.dart';
import 'package:vietnamfood/models/food_model.dart';
import 'package:vietnamfood/models/news_model.dart';
import 'package:vietnamfood/models/shop_model.dart';

class HomeController {
  final newRef = FirebaseFirestore.instance
      .collection('News')
      .withConverter<NewsModel>(
        fromFirestore: (snapshot, _) => NewsModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
  final foodRef = FirebaseFirestore.instance
      .collection('Foods')
      .withConverter<FoodModel>(
        fromFirestore: (snapshot, _) => FoodModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
  final placeRef = FirebaseFirestore.instance
      .collection('Places')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
  final eventRef = FirebaseFirestore.instance
      .collection('Events')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );
  void pushData() {
    for (int index = 0; index < 5; index++) {
      final EventModel model = places[0];
      placeRef.add(model);
    }
    for (int index = 0; index < 5; index++) {
      final EventModel model = places[0];
      eventRef.add(model);
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}

List<FoodModel> foods = [
  FoodModel(
    id: generateKey(),
    name: "Bún bò huế",
    nameEn: "Bun bo Hue",
    url:
        "https://ik.imagekit.io/tvlk/blog/2018/03/dac-san-hue-2-bun-bo-hue.jpg",
    shops: [
      ShopModel(
        id: generateKey(),
        name: "Quán bà Tuyết",
        nameEn: "Mrs. Tuyet's restaurant",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4630226,
        longitude: 107.5891205,
      ),
      ShopModel(
        id: generateKey(),
        name: "Bún bò Huế",
        nameEn: "Bun bo Hue",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4621408,
        longitude: 107.5874129,
      ),
    ],
  ),
  FoodModel(
    id: generateKey(),
    name: "Mè xửng",
    nameEn: "Me Xung",
    url:
        "https://ik.imagekit.io/tvlk/blog/2018/03/dac-san-hue-3-keo-me-xung.jpg?tr=dpr-2,w-675",
    shops: [
      ShopModel(
        id: generateKey(),
        name: "Mè xửng Thiên Hương",
        nameEn: "Me xung Thien Huong",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4630226,
        longitude: 107.5891205,
      ),
      ShopModel(
        id: generateKey(),
        name: "Mè xửng Nam Thuận",
        nameEn: "Me Xung Nam Thuan",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4621408,
        longitude: 107.5874129,
      ),
    ],
  ),
  FoodModel(
    id: generateKey(),
    name: "Chè Huế",
    nameEn: "Che Hue",
    url:
        "https://ik.imagekit.io/tvlk/blog/2018/03/dac-san-hue-4-che-hue.jpg?tr=dpr-2,w-675",
    shops: [
      ShopModel(
        id: generateKey(),
        name: "Chè Hẻm",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4630226,
        longitude: 107.5891205,
      ),
      ShopModel(
        id: generateKey(),
        name: "Chè Sao",
        nameEn: "Che Sao",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4621408,
        longitude: 107.5874129,
      ),
    ],
  ),
  FoodModel(
    id: generateKey(),
    name: "Nem lụi Huế",
    nameEn: "Nem lui Hue",
    url:
        "https://ik.imagekit.io/tvlk/blog/2018/03/dac-san-hue-nem-lui-hue.jpg?tr=dpr-2,w-675",
    shops: [
      ShopModel(
        id: generateKey(),
        name: "Bún Thịt Nướng & Nem Lụi Bà Tý",
        nameEn: "Ba Ty Grilled Vermicelli & Nem Lui",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4630226,
        longitude: 107.5891205,
      ),
      ShopModel(
        id: generateKey(),
        name: "Tài Phú",
        nameEn: "Tai Phu",
        summary:
            "Đứng đầu danh sách trong TOP những đặc sản Huế mua về làm quà là Mè xửng. Mè xửng Huế nổi tiếng khắp trong và ngoài nước, trở thành linh hồn của người dân cố đô.",
        summaryEn:
            "Topping the list of Hue specialties to buy as gifts is sesame seeds. Hue sesame seeds are famous throughout the country and abroad, becoming the soul of the people of the ancient capital.",
        urls: [
          "https://eholiday.vn/wp-content/uploads/2022/10/Keo-me-xung-Hue.jpg?v=1681982017"
        ],
        latitude: 16.4621408,
        longitude: 107.5874129,
      ),
    ],
  ),
];

List<NewsModel> news = [
  NewsModel(
    id: generateKey(),
    title: "Phở Bò Việt (Phở Bò) ",
    content:
        "Phở Bò Việt (Phở Bò) là một trong những món ăn phổ biến nhất ở Việt Nam. Nguồn gốc của Phở bò Việt Nam bắt nguồn từ miền Bắc Việt Nam vào đầu thế kỷ 20 và sau đó trở nên phổ biến ở Việt Nam và nhiều nơi trên thế giới sau chiến tranh Việt Nam. Phở bò Việt là sự kết hợp của nước dùng, bánh phở, một số loại rau thơm, và thịt bò hoặc thịt gà.",
    titleEn: "Vietnamese Beef Noodle",
    contentEn:
        "Vietnamese Beef Noodle (Phở Bò) is one of the most popular dish in Vietnam. The origin of Vietnamese Beef Noodle originated in northern Vietnam in the early 20th century and then became popular in Vietnam and many parts of the world after the Vietnam War.Vietnamese Beef Noodle is the combination of broth, rice noodles (Bánh Phở)",
    url:
        "https://img.freepik.com/free-psd/food-menu-restaurant-facebook-cover-template_120329-1690.jpg",
  ),
  NewsModel(
    id: generateKey(),
    title: "Phở Bò Việt (Phở Bò) ",
    content:
        "Phở Bò Việt (Phở Bò) là một trong những món ăn phổ biến nhất ở Việt Nam. Nguồn gốc của Phở bò Việt Nam bắt nguồn từ miền Bắc Việt Nam vào đầu thế kỷ 20 và sau đó trở nên phổ biến ở Việt Nam và nhiều nơi trên thế giới sau chiến tranh Việt Nam. Phở bò Việt là sự kết hợp của nước dùng, bánh phở, một số loại rau thơm, và thịt bò hoặc thịt gà.",
    titleEn: "Vietnamese Beef Noodle",
    contentEn:
        "Vietnamese Beef Noodle (Phở Bò) is one of the most popular dish in Vietnam. The origin of Vietnamese Beef Noodle originated in northern Vietnam in the early 20th century and then became popular in Vietnam and many parts of the world after the Vietnam War.Vietnamese Beef Noodle is the combination of broth, rice noodles (Bánh Phở)",
    url:
        "https://img.freepik.com/free-psd/food-menu-restaurant-facebook-cover-template_120329-1690.jpg",
  ),
  NewsModel(
    id: generateKey(),
    title: "",
    content: "",
    url:
        "https://graphicsfamily.com/wp-content/uploads/edd/2022/09/Food-Menu-Social-Media-Banner-Design-scaled.jpg",
  )
];

List<EventModel> places = [
  EventModel(
    id: generateKey(),
    name: "Nhà thờ Phủ Cam Huế",
    nameEn: "Phu Cam Hue Church",
    descriptionEn:
        "Phu Cam Church is one of the famous landmarks of the ancient capital with nearly 400 years of age. Possessing ancient Western architecture, Phu Cam church is an extremely hot check-in spot for many travel enthusiasts.",
    description:
        "Nhà thờ Phủ Cam là một trong những địa danh nổi tiếng xứ cố đô với tuổi đời gần 400 năm. Sở hữu lối kiến trúc phương Tây đầy cổ kính, nhà thờ Phủ Cam là điểm check-in cực hot của rất nhiều tín đồ đam mê du lịch.",
    thumbnail: "https://statics.vinpearl.com/nha-tho-phu-cam-0_1633013032.png",
    events: [
      ShopModel(
          id: generateKey(),
          name: "Nhà thờ Phủ Cam Huế",
          nameEn: "Phu Cam Hue Church",
          summary:
              "Nhà thờ Phủ Cam là một trong những địa danh nổi tiếng xứ cố đô với tuổi đời gần 400 năm. Sở hữu lối kiến trúc phương Tây đầy cổ kính, nhà thờ Phủ Cam là điểm check-in cực hot của rất nhiều tín đồ đam mê du lịch.",
          summaryEn:
              "Phu Cam Church is one of the famous landmarks of the ancient capital with nearly 400 years of age. Possessing ancient Western architecture, Phu Cam church is an extremely hot check-in spot for many travel enthusiasts.",
          urls: [
            "https://statics.vinpearl.com/nha-tho-phu-cam-0_1633013032.png",
            "https://statics.vinpearl.com/nha-tho-phu-cam-0_1633013032.png"
          ],
          latitude: 16.4413783,
          longitude: 107.5898639)
    ],
  ),
];

const String defaultUrlAvatar =
    "https://firebasestorage.googleapis.com/v0/b/my-htu-ba12c.appspot.com/o/Profile%2Favatar.png?alt=media&token=daabe484-0629-4f14-a00d-76ba5e8a12f9";

generateKey() {
  const int length = 20;
  const String letersLowercase = "qwertyuiopasdfghjklzxcvbnm";
  const String letersUppercase = "QWERTYUIOPASDFGHJKLZXCVBNM";
  const String numbers = "1234567890";
  String chart = "";
  chart += "$letersLowercase$letersUppercase";
  chart += numbers;

  return List.generate(length, (index) {
    final indexRandom = Random.secure().nextInt(length);

    return chart[indexRandom];
  }).join("");
}

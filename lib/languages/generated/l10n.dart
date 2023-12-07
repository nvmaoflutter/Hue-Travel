// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Xin chào bạn!`
  String get intro {
    return Intl.message(
      'Xin chào bạn!',
      name: 'intro',
      desc: '',
      args: [],
    );
  }

  /// `Hân hạnh chào mừng bạn đến với ứng dụng`
  String get welcomeToApp {
    return Intl.message(
      'Hân hạnh chào mừng bạn đến với ứng dụng',
      name: 'welcomeToApp',
      desc: '',
      args: [],
    );
  }

  /// `Món ăn đặc sản`
  String get foodSpecial {
    return Intl.message(
      'Món ăn đặc sản',
      name: 'foodSpecial',
      desc: '',
      args: [],
    );
  }

  /// `địa điểm`
  String get location {
    return Intl.message(
      'địa điểm',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cơ bản`
  String get infomation {
    return Intl.message(
      'Thông tin cơ bản',
      name: 'infomation',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get phone {
    return Intl.message(
      'Số điện thoại',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ`
  String get address {
    return Intl.message(
      'Địa chỉ',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Giờ mở cửa`
  String get timeOpen {
    return Intl.message(
      'Giờ mở cửa',
      name: 'timeOpen',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách đánh giá`
  String get listReview {
    return Intl.message(
      'Danh sách đánh giá',
      name: 'listReview',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin chi tiết`
  String get detailShop {
    return Intl.message(
      'Thông tin chi tiết',
      name: 'detailShop',
      desc: '',
      args: [],
    );
  }

  /// `Sự kiện - Lễ hội - Văn hóa`
  String get event {
    return Intl.message(
      'Sự kiện - Lễ hội - Văn hóa',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Hình ảnh`
  String get image {
    return Intl.message(
      'Hình ảnh',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Địa điểm`
  String get place {
    return Intl.message(
      'Địa điểm',
      name: 'place',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

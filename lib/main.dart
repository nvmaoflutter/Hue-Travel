import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'languages/generated/l10n.dart';
import 'storage/storage.dart';
import 'views/home/widgets/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) async {
    MyAppState? state = context.findAncestorStateOfType<MyAppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale locale = const Locale("vi");
  @override
  void initState() {
    super.initState();
    initLanguage();
    setLanguage();
  }

  initLanguage() {
    if (Storage.hasData("language") == false) {
      Storage.saveValue("language", "vi");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(414, 896),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locale,
        theme: ThemeData(
            fontFamily: "SF-Pro",
            scaffoldBackgroundColor: Colors.white.withOpacity(0.98)),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const HomePage(),
      ),
    );
  }

  setLanguage() {
    setState(() {
      final String? language = Storage.getValue("language");
      if (language == "vi") {
        locale = const Locale("vi");
        S.load(const Locale("vi"));
      } else {
        locale = const Locale("en");
        S.load(const Locale("en"));
      }
    });
  }

  changeLanguage(Locale locale) {
    setState(() {
      this.locale = locale;
      Storage.removeValue("language");
      Storage.saveValue("language", locale.languageCode);
      S.load(locale);
    });
  }
}

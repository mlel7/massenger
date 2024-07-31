import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:massenger/middlewere/auth_middlewere.dart';
import 'package:massenger/model/light_mode.dart';
import 'package:massenger/view/home_page.dart';
import 'package:massenger/view/login_page.dart';
import 'package:get/get.dart';
import 'package:massenger/view/register_page.dart';
import 'firebase_options.dart';
import 'translations/translations.dart';
import "package:get_storage/get_storage.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      translations: Translation(),
      locale: Get.deviceLocale,
      
      initialRoute: "/home",
      getPages: [
        GetPage(
            name: "/home",
            page: () => const HomePage(),
            middlewares: [AuthMiddlewere()]),
        GetPage(
          name: "/login",
          page: () => LoginPage(),
        ),
        GetPage(name: "/register", page: () => RegisterPage())
      ],
    );
  }
}

// ignore: implementation_imports
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddlewere extends GetMiddleware {
  bool isLogin = true;
  final box = GetStorage();
  @override
  RouteSettings? redirect(String? route) {
    if(box.read("isLogin")==null){
      return const RouteSettings(name: "/login");
    }
    return null;    
    
    
  }
}

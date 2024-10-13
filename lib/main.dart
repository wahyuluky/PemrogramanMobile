

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:mobile/app/modules/splash/bindings/splash_binding.dart';
import 'package:mobile/app/data/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
//import 'package:googleapis_auth/auth_io.dart';

void main() async{
  await GetStorage.init();
  Get.lazyPut(() => AuthController());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}






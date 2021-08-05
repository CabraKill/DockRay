import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'initialBinding.dart';
import 'pages/pages.dart';
import 'package:yaru/yaru.dart' as yaru;

void main() {
  runApp(GetMaterialApp(
    theme: yaru.lightTheme,
    darkTheme: yaru.darkTheme,
    getPages: Pages.pages,
    initialRoute: "/home",
    initialBinding: InitialBinding(),
    debugShowCheckedModeBanner: false,
  ));
}

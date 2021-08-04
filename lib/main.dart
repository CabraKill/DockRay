import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'initialBinding.dart';
import 'pages/pages.dart';

void main() {
  runApp(GetMaterialApp(
    getPages: Pages.pages,
    initialRoute: "/home",
    initialBinding: InitialBinding(),
    debugShowCheckedModeBanner: false,
  ));
}

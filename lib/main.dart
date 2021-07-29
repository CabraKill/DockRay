import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:system_call_test/pages/pages.dart';

import 'initialBinding.dart';

void main() {
  runApp(GetMaterialApp(
    getPages: Pages.pages,
    initialRoute: "/home",
    initialBinding: InitialBinding(),
    debugShowCheckedModeBanner: false,
  ));
}

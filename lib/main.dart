import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'pages/home.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

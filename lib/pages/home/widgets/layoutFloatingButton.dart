import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homeController.dart';

class LayoutFloatingButtonHome extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return FloatingActionButton(
        onPressed: controller.changeLayout,
        child: Icon(currentIcon),
      );
    });
  }

  IconData get currentIcon {
    if (controller.layoutHome == LayoutHome.grid) return Icons.grid_view;
    return Icons.list;
  }
}

enum LayoutHome { grid, list }

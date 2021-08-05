import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeController.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: controller.updateImageList,
                icon: Icon(Icons.update)),
            IconButton(
                onPressed: controller.cleanSystem, icon: Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                headersWidget(["Id", "Image", "Size"]),
                Container(
                  height: 2,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                ...controller.imageList.map((image) => imageWidget(
                    image['ID'], image['Repository'], image['Size']))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.grid_view)),
      ),
    );
  }

  Widget headersWidget(List<String> titulos) {
    return Row(
      children: titulos.map((titulo) => Text(titulo)).toList(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget imageWidget(String id, String name, String size) {
    return Row(
      children: [
        Expanded(child: Center(child: Text(id))),
        Expanded(child: Center(child: Text(name))),
        Expanded(child: Center(child: Text(size)))
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}

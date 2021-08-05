import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/layoutFloatingButton.dart';

class _Rx {
  final layoutHome = LayoutHome.grid.obs;
  final imageList = <Map<dynamic, dynamic>>[].obs;
}

class HomeController extends GetxController {
// final MyRepository repository;
  void changeLayout() {}

  final _rx = _Rx();

  LayoutHome get layoutHome => _rx.layoutHome.value;

  List<Map<dynamic, dynamic>> get imageList => _rx.imageList;

  @override
  void onInit() {
    super.onInit();
    updateImageList();
  }

  Future<dynamic> updateImageList() async {
    late ProcessResult processResult;

    processResult = await Process.run(
        'docker', ['images', '--format', '"{{json .}}"'],
        runInShell: true);
    // print(rs.exitCode);
    // print(rs.stdout);
    // print(rs.stderr);
    final result = processResult.stdout;

    final List<String> list1 = result.split("\n");
    final list2 = list1.where((element) => element.isNotEmpty).toList();
    _rx.imageList.value = list2
        .map<Map>((e) => jsonDecode(e.substring(1, e.length - 1)))
        .toList();
    // print(images.join(" "));
  }

  void cleanSystem() async {
    try {
      await Process.run("docker", ["system", "prune", "-f"]);
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('System cleaned 🚩')));
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Something is quite wrong... 🐞')));
    }
    updateImageList();
  }
}

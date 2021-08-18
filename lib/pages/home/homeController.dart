import 'dart:io';
import 'package:dockray/docker/repository/dockerRepository.dart';
import 'package:dockray/utils/dialogs/error/showErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/layoutFloatingButton.dart';

class _Rx {
  final layoutHome = LayoutHome.grid.obs;
  final imageList = <Map<dynamic, dynamic>>[].obs;
}

class HomeController extends GetxController {
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
    try {
      _rx.imageList.value = Get.find<DockerRepository>().getImages();
    } catch (e) {
      showErrorDialog(e.toString());
    }
  }

  void cleanSystem() async {
    try {
      final processResult = await Process.run(
          "dockray-docker", ["system", "prune", "-f"],
          runInShell: true);
      final result = processResult.stdout;
      final status = processResult.exitCode;
      final error = processResult.stderr;
      print("output: $result | exit: $status | error: $error");
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('System cleaned 🚩')));
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text('Something is quite wrong... 🐞')));
    }
    updateImageList();
  }

  Future<void> test() async {
    try {
      late ProcessResult processResult;
      print("Process initied");
      processResult =
          Process.runSync('which', ['dockray-docker'], runInShell: true);
      final result = processResult.stdout;
      final status = processResult.exitCode;
      final error = processResult.stderr;
      print("output: $result | exit: $status | error: $error");
      print("Process ended");
    } catch (e) {
      showErrorDialog(e.toString());
    }
  }
}

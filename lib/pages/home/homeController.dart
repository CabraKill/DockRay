import 'dart:convert';
import 'dart:io';
import 'package:dockray/utils/dialogs/error/showErrorDialog.dart';
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
    try {
      late ProcessResult processResult;
      print("Process initied");
      processResult = Process.runSync(
          "dockray-docker", ["images", "--format", '"{{json .}}"'],
          runInShell: true);
      // print(rs.exitCode);
      // print(rs.stdout);
      // print(rs.stderr);
      final result = processResult.stdout;
      final status = processResult.exitCode;
      final error = processResult.stderr;
      print("output: $result | exit: $status | error: $error");

      final List<String> list1 = result.split("\n");
      final list2 = list1.where((element) => element.isNotEmpty).toList();
      _rx.imageList.value = list2
          .map<Map>((e) => jsonDecode(e.substring(1, e.length - 1)))
          .toList();
      // print(images.join(" "));
      print("Process ended");
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

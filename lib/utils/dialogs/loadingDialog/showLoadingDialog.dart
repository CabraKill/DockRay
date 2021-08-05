import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loadingDialog.dart';

Future<void> showLoadingDialog() async {
  return Get.dialog(AlertDialog(content: LoadingDialog()),
      barrierDismissible: true);
}

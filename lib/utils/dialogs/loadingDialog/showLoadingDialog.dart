import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_call_test/utils/dialogs/loadingDialog/loadingDialog.dart';

Future<void> showLoadingDialog(context) async {
  return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(content: LoadingDialog()),
      barrierDismissible: true);
}

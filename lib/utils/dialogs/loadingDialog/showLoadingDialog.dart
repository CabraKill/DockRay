import 'package:flutter/material.dart';
import 'loadingDialog.dart';

Future<void> showLoadingDialog(context) async {
  return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(content: LoadingDialog()),
      barrierDismissible: true);
}

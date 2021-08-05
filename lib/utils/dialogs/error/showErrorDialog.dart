import 'package:dockray/utils/dialogs/error/errorDialog.dart';
import 'package:get/get.dart';

Future<void> showErrorDialog(String error) =>
    Get.dialog(ErrorDialog(error: error));

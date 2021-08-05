import 'package:get/get.dart';

import 'showLoadingDialog.dart';

Future<bool> loading(Function toDo) async {
  showLoadingDialog();
  await toDo();
  Get.back();
  return true;
}

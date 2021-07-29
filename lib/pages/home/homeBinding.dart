import 'package:get/get.dart';
import 'package:system_call_test/pages/home/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

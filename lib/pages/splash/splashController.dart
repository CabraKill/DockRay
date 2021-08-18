import 'package:dockray/pages/home/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    //TODO: check for docker availability in the future
    initTimer();
  }

  void initTimer() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(HomePage.routeName);
  }
}

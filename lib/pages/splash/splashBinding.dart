import 'package:dockray/docker/data/IO/dockerContainersIODriver.dart';
import 'package:dockray/docker/data/IO/dockerImagesIODriver.dart';
import 'package:dockray/docker/repository/dockerRepository.dart';
import 'package:get/get.dart';
import 'splashController.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => DockerRepository(
            DockerImagesIODriver(), DockerContainersIODriver()),
        fenix: true);
    Get.put(SplashController());
  }
}

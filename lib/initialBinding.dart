import 'package:get/get.dart';
import 'services/dockerService.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DockerService(), permanent: true);
  }
}

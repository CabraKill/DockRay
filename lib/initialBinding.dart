import 'package:get/get.dart';
import 'package:system_call_test/services/dockerService.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DockerService(), permanent: true);
  }
}

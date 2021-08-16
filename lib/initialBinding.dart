import 'package:dockray/data/docker/containers/dockerContainersRepository.dart';
import 'package:dockray/data/docker/dockerRepository.dart';
import 'package:dockray/data/docker/images/dockerImagesRepository.dart';
import 'package:dockray/services/docker/images/repository/dockerImageAdapter.dart';
import 'package:get/get.dart';
import 'services/docker/dockerService.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
        DockerService(DockerRepository(
            DockerContainersRepository(), DockerImagesRepository())),
        permanent: true);
  }
}

import 'package:dockray/services/docker/repository/dockerAdapter.dart';
import 'package:get/get.dart';

class DockerService extends GetxService {
  final DockerAdapter dockerAdapter;

  DockerService(this.dockerAdapter);

  Future<DockerService> init() async {
    return this;
  }
}

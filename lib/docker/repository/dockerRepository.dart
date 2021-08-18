import 'package:dockray/docker/containers/IdockerContainersDriver.dart';
import 'package:dockray/docker/images/IdockerImagesDriver.dart';
import 'package:dockray/docker/repository/IdockerRespository.dart';

class DockerRepository extends IDockerRepository {
  final IDockerImagesDriver dockerImagesDriver;
  final IDockerContainersDriver dockerContainersDriver;

  DockerRepository(this.dockerImagesDriver, this.dockerContainersDriver);

  @override
  getContainers() {
    final containers = dockerContainersDriver.getContainers();
    return containers;
  }

  @override
  getImages() {
    final images = dockerImagesDriver.getImages();
    return images;
  }
}

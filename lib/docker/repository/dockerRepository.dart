import 'package:dockray/docker/containers/IdockerContainersDriver.dart';
import 'package:dockray/docker/images/IdockerImagesDriver.dart';
import 'package:dockray/docker/repository/IdockerRespository.dart';

class DockerRepository extends IDockerRepository {
  final IDockerImagesDriver _dockerImagesDriver;
  final IDockerContainersDriver _dockerContainersDriver;

  DockerRepository(this._dockerImagesDriver, this._dockerContainersDriver);

  @override
  getContainers() {
    final containers = _dockerContainersDriver.getContainers();
    return containers;
  }

  @override
  getImages() {
    final images = _dockerImagesDriver.getImages();
    return images;
  }
}

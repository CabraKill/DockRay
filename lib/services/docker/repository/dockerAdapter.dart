import 'package:dockray/services/docker/containers/repository/dockerContainerAdapter.dart';
import 'package:dockray/services/docker/images/repository/dockerImageAdapter.dart';

abstract class DockerAdapter {
  final DockerContainersAdapter dockerContainersAdapter;
  final DockerImagesAdapter dockerImagesAdapter;

  DockerAdapter(this.dockerContainersAdapter, this.dockerImagesAdapter);

  getContainers();

  getImages();
}

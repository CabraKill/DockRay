import 'package:dockray/services/docker/images/repository/dockerImageAdapter.dart';
import 'package:dockray/services/docker/containers/repository/dockerContainerAdapter.dart';
import 'package:dockray/services/docker/repository/dockerAdapter.dart';

class DockerRepository extends DockerAdapter {
  DockerRepository(DockerContainersAdapter dockerContainersAdapter,
      DockerImagesAdapter dockerImagesAdapter)
      : super(dockerContainersAdapter, dockerImagesAdapter);

  @override
  getContainers() {
    // TODO: implement getContainers
    throw UnimplementedError();
  }

  @override
  getImages() {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}

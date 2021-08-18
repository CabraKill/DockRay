import 'dart:convert';
import 'dart:io';

import '../../images/IdockerImagesDriver.dart';

class DockerImagesIODriver implements IDockerImagesDriver {
  @override
  getImages() {
    late ProcessResult processResult;
    print("Process initied");
    //dockray-docker
    processResult = Process.runSync(
        "docker", ["images", "--format", '"{{json .}}"'],
        runInShell: true);
    print("Process ended");
    // print(rs.exitCode);
    // print(rs.stdout);
    // print(rs.stderr);
    final result = processResult.stdout;
    final status = processResult.exitCode;
    final error = processResult.stderr;
    print("output: $result | exit: $status | error: $error");

    final List<String> list1 = result.split("\n");
    final list2 = list1.where((element) => element.isNotEmpty).toList();
    final listImages = list2
        .map<Map>((e) => jsonDecode(e.substring(1, e.length - 1)))
        .toList();
    return listImages;
  }
}

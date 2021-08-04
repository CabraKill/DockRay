import 'dart:convert';
import 'dart:io';
import 'package:dockray/utils/dialogs/loadingDialog/showLoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> images = [];

  @override
  void initState() {
    super.initState();
    updateImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: updateImageList, icon: Icon(Icons.update)),
          IconButton(onPressed: cleanSystem, icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              headersWidget(["Id", "Image", "Size"]),
              Container(
                height: 2,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              ...images.map((image) =>
                  imageWidget(image['ID'], image['Repository'], image['Size']))
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.grid_view)),
    );
  }

  Widget headersWidget(List<String> titulos) {
    return Row(
      children: titulos.map((titulo) => Text(titulo)).toList(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget imageWidget(String id, String name, String size) {
    return Row(
      children: [
        Expanded(child: Center(child: Text(id))),
        Expanded(child: Center(child: Text(name))),
        Expanded(child: Center(child: Text(size)))
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Future<bool> loading(Function toDo) async {
    showLoadingDialog(context);
    await toDo();
    Get.back();
    return true;
  }

  Future<dynamic> updateImageList() async {
    ProcessResult? processResult;

    await loading(() async {
      processResult = await Process.run(
          'docker', ['images', '--format', '"{{json .}}"'],
          runInShell: true);
    });
    // print(rs.exitCode);
    // print(rs.stdout);
    // print(rs.stderr);
    final result = processResult!.stdout;

    final List<String> list1 = result.split("\n");
    final list2 = list1.where((element) => element.isNotEmpty).toList();
    setState(() {
      images = list2
          .map<Map>((e) => jsonDecode(e.substring(1, e.length - 1)))
          .toList();
    });
    // print(images.join(" "));
  }

  void cleanSystem() async {
    try {
      await Process.run("docker", ["system", "prune", "-f"]);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('System cleaned 🚩')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something is quite wrong... 🐞')));
    }
    setState(() {
      updateImageList();
    });
  }
}

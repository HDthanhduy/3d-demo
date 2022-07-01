import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Object jet;
  late Object shark;
  late Object shiba;
  late Object astronaut;
  @override
  void initState() {
    jet = Object(fileName: "assets/jet/Jet.obj");
    shark = Object(fileName: "assets/shark/shark.obj");
    astronaut = Object(
        fileName: "https://modelviewer.dev/shared-assets/models/Astronaut.glb");
    shark.rotation.setValues(0, 90, 0);
    shark.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Flutter 3D"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(shark);
                  scene.camera.zoom = 10;
                },
              ),
            ),
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(jet);
                  scene.camera.zoom = 10;
                },
              ),
            ),
            Expanded(
              child: ModelViewer(
                src: "assets/shiba/panda2.glb",
                alt: "A 3D model of an astronaut",
                ar: true,
                autoRotate: false,
                cameraControls: true,
                enablePan: false,
                disableZoom: false,
                loading: Loading.eager,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

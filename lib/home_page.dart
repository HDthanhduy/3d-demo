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
  @override
  void initState() {
    jet = Object(fileName: "assets/jet/Jet.obj");
    shark = Object(fileName: "assets/shark/shark.obj");
    shiba = Object(fileName: "assets/shiba/Astronaut.glb");
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
            // Expanded(
            //   child: Cube(
            //     onSceneCreated: (Scene scene) {
            //       scene.world.add(shark);
            //       scene.camera.zoom = 10;
            //     },
            //   ),
            // ),
            // Expanded(
            //   child: Cube(
            //     onSceneCreated: (Scene scene) {
            //       scene.world.add(jet);
            //       scene.camera.zoom = 10;
            //     },
            //   ),
            // ),
            Expanded(
              child: ModelViewer(
                src:
                    'https://docs.mapbox.com/mapbox-gl-js/assets/34M_17/34M_17.gltf',
                alt: "A 3D model of an astronaut",
                ar: true,
                autoRotate: true,
                cameraControls: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

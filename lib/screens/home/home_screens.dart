

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeScreen extends StatelessWidget {
    String js = r'''
(() => {
  const modelViewer = document.querySelector('#orbit-demo');
  const orbitCycle = [
    '45deg 55deg 4m',
    '-60deg 110deg 2m',
    modelViewer.cameraOrbit
  ];
  setInterval(() => {
    const currentOrbitIndex = orbitCycle.indexOf(modelViewer.cameraOrbit);
    modelViewer.cameraOrbit =
        orbitCycle[(currentOrbitIndex + 1) % orbitCycle.length];
  }, 3000);
})();
''';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Model Viewer")),
          body: ModelViewer(
            id: "revea",
            loading: Loading.eager,
            cameraControls: true,
            autoRotate: true,
            // poster: "https://modelviewer.dev/assets/poster-shishkebab.png",
            src: "assets/shiba/panda2.glb",
            alt: "A 3D model of a shishkebab",
            relatedJs: js,
            interpolationDecay: 200,
            arModes: ['scene-viewer', 'webxr', 'quick-look'],
            skyboxImage:
              "https://modelviewer.dev/shared-assets/environments/spruit_sunrise_1k_HDR.hdr",
          )),
    );
  }
}
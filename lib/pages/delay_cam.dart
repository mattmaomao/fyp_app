// pages/delay_cam.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'package:camera/camera.dart';
late List<CameraDescription> cameras;


class DelayCamPage extends StatefulWidget {
  const DelayCamPage({super.key});
  State<DelayCamPage> createState() => _DelayCamPageState();
}

class _DelayCamPageState extends State<DelayCamPage>{
  late CameraController cameracontroller;
  late Future<void> cameravalue;

  @override
  void initState() {
    super.initState();
    print('Initializing cameras...');
    cameracontroller = CameraController(cameras[0], ResolutionPreset.max);
    cameravalue = cameracontroller.initialize();
  }    

  @override
  void dispose() {
    cameracontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Delay Camera'),
      body: Stack(children: [
        FutureBuilder(future: cameravalue, builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
          return CameraPreview(cameracontroller);
        } else {
          return Center(child: CircularProgressIndicator());
        }
        },)
      ])
      
    );
  }
}

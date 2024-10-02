// pages/delay_cam.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;


class DelayCamPage extends StatefulWidget {
  const DelayCamPage({super.key});

  @override
  State<DelayCamPage> createState() => _DelayCamPageState();
}

class _DelayCamPageState extends State<DelayCamPage>{

  late CameraController controller;
  late Future<void> cameravalue;
  XFile? _latestFrame;
  List<XFile> _frameBuffer = [];

  @override
  void initState() {
     super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = controller.initialize();
    cameravalue.then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image){
        _frameBuffer.add(image as XFile);
        if (_frameBuffer.length > 5) {
        _frameBuffer.removeAt(0); // Remove the oldest frame
      }
      });
      setState(() {
        Future.delayed(Duration(seconds: 3));
        _latestFrame = _frameBuffer.first;});
    });
  }    

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Delay Camera'),
      body: FutureBuilder<void>(
          future: cameravalue, 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.file(File(_latestFrame!.path));
            }
          return Center(child: CircularProgressIndicator());
        },
        ),
      );
  }
}

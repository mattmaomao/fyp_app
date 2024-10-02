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

class _DelayCamPageState extends State<DelayCamPage> {
  late CameraController controller;
  late Future<void> cameravalue;
  XFile? _latestFrame;
  List<XFile> _frameBuffer = [];

  @override
  void initState() {
    super.initState();
    print("init state");
    controller = CameraController(cameras[0], ResolutionPreset.high);
    cameravalue = controller.initialize();
    cameravalue.then((_) {
      print("enter then");
      if (!mounted) {
        print("!mounted");
        return;
      }
      print("mounted");
      controller.startImageStream((image) {
        print("enter start image stream");
        try {
          _frameBuffer.add(image as XFile);
        } catch (e) {
          print("Error: $e");
        }
        if (_frameBuffer.length > 5) {
          print("remove oldest frame");
          _frameBuffer.removeAt(0); // Remove the oldest frame
        }
      });
      print("before set state");
      setState(() {
        print("delay 3 sec");
        Future.delayed(Duration(seconds: 3));
        print("set latest frame");
        print("$_latestFrame");
        print("$_frameBuffer");
        print("${_frameBuffer.isNotEmpty}");
        if (_frameBuffer.isNotEmpty) _latestFrame = _frameBuffer.first;
        // _latestFrame = _frameBuffer.first;
        print("bruh");
      });
      print("after set state");
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
            print("connection done");
            if (_latestFrame != null) {
              return Image.file(File(_latestFrame!.path));
            }
          }
          print("connection fk");
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

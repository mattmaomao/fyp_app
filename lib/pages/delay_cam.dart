// pages/delay_cam.dart
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'package:camera/camera.dart';

/*
class DelayCamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Delay Camera'),
      body: Center(
        child: Text('Functionality to be implemented'),
      ),
    );
  }
}
*/

class DelayCamPage extends StatefulWidget {
  @override
  _DelayCamPageState createState() => _DelayCamPageState();
}

class _DelayCamPageState extends State<DelayCamPage>{
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    print('Initializing cameras...');
    availableCameras().then((cameras) {
      print('Cameras available: ${cameras.length}');
      if (cameras.isNotEmpty){
       final camera = cameras.first;
        _controller = CameraController(camera, ResolutionPreset.high,);
        print('Initializing camera controller...');

      _initializeControllerFuture = _controller!.initialize().then((_){
        print('Camera initialized successfully.');
      }).catchError((error){
        print('Error initializing camera: $error');
      });
      } else {
        print('No cameras found');
      }
    }).catchError((error){
      print('Error getting cameras: $error');
    });
  }    
  

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWithTitle(title: 'Delay Camera'),
      body: FutureBuilder<void>(future: _initializeControllerFuture, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          return CameraPreview(_controller!);
        } else {
        //  return Center(child: CircularProgressIndicator());
        return Center(child: Text('Camera preview is unavailable'));
        }
      },),
/*
      floatingActionButton: FloatingActionButton(onPressed: () async {
        try {
          await _initializeControllerFuture;
          final image = await _controller!.takePicture();
          print('Picture saved');
        } catch (e){
          print(e);
        }
      }, child: Icon(Icons.camera),),
      */
    );
  }
}

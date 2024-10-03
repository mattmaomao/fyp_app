// pages/delay_cam.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp_app/utils/header_with_title.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart'; // For image processing


late List<CameraDescription> cameras;

class DelayCamPage extends StatefulWidget {
  const DelayCamPage({super.key});

  @override
  State<DelayCamPage> createState() => _DelayCamPageState();
}

class _DelayCamPageState extends State<DelayCamPage> {
  late CameraController controller;
  late Future<void> cameravalue;
  CameraImage? _latestFrame;
  List<CameraImage> _frameBuffer = [];
  Future<XFile?>? display;

  @override
  void initState() {
    super.initState();
    print("init state");
    initializeCamera();
    // controller = CameraController(cameras[0], ResolutionPreset.high);
    // cameravalue = controller.initialize();
    // cameravalue.then((_) {
    //   print("enter then");
    //   if (!mounted) {
    //     print("!mounted");
    //     return;
    //   }
    //   print("mounted");
    //   print(controller);
    //   controller.startImageStream((image) {
    //     print("enter start image stream");
    //     try {
    //       setState(() {
    //         _frameBuffer.add(image);
    //       });
    //     } catch (e) {
    //       print("Error: $e");
    //     }
    //     //  _frameBuffer.add(image);
    //     if (_frameBuffer.length > 5) {
    //       print("remove oldest frame");
    //       setState(() {
    //         _frameBuffer.removeAt(0); // Remove the oldest frame
    //       });
    //       // _frameBuffer.removeAt(0); // Remove the oldest frame
    //     } else {
    //       print('<5');
    //     }
    //   });
    //   print("before set state");
    //   setState(() {
    //     print("delay 3 sec");
    //     Future.delayed(Duration(seconds: 3));
    //     print("set latest frame");
    //     print("$_latestFrame");
    //     print("$_frameBuffer");
    //     print("${_frameBuffer.isNotEmpty}");
    //     if (_frameBuffer.isNotEmpty) _latestFrame = _frameBuffer.first;
    //     // _latestFrame = _frameBuffer.first;
    //     print("bruh");
    //   });
    //   print("after set state");
    // });
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.low);
    await controller.initialize();
    controller.startImageStream((image) {
      print("enter start image stream");
      _frameBuffer.add(image);
      print("frame added");
      if (_frameBuffer.length > 5) {
        setState(() {
          _frameBuffer.removeAt(0); // Remove the oldest frame
          print("frame removed");
        });
      }

      // Set the latest frame after a delay
      setLatestFrameAfterDelay();
    });
  }

  void setLatestFrameAfterDelay() {
    Future.delayed(Duration(seconds: 3), () {
      if (_frameBuffer.isNotEmpty) {
        setState(() {
          _latestFrame = _frameBuffer.last; // Set the latest frame
          // Convert the latest frame to XFile
          display = convertCameraImageToXFile(_latestFrame!);
          print("Display future set with latest frame");
        });
      } else {
        print("No frames available in buffer");
      }
    });
  }

  static imglib.Image convertCameraImage(CameraImage cameraImage) {
    if (cameraImage.format.group == ImageFormatGroup.yuv420) {
      return convertYUV420ToImage(cameraImage);
    } else if (cameraImage.format.group == ImageFormatGroup.bgra8888) {
      return convertBGRA8888ToImage(cameraImage);
    } else {
      throw Exception('Undefined image type.');
    }
  }

  static imglib.Image convertBGRA8888ToImage(CameraImage cameraImage) {
    return imglib.Image.fromBytes(
      width: cameraImage.planes[0].width!,
      height: cameraImage.planes[0].height!,
      bytes: cameraImage.planes[0].bytes.buffer,
      order: imglib.ChannelOrder.bgra,
    );
  }

  ///
  /// Converts a [CameraImage] in YUV420 format to [image_lib.Image] in RGB format
  ///
  static imglib.Image convertYUV420ToImage(CameraImage cameraImage) {
    final imageWidth = cameraImage.width;
    final imageHeight = cameraImage.height;

    final yBuffer = cameraImage.planes[0].bytes;
    final uBuffer = cameraImage.planes[1].bytes;
    final vBuffer = cameraImage.planes[2].bytes;

    final int yRowStride = cameraImage.planes[0].bytesPerRow;
    final int yPixelStride = cameraImage.planes[0].bytesPerPixel!;

    final int uvRowStride = cameraImage.planes[1].bytesPerRow;
    final int uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    final image = imglib.Image(width: imageWidth, height: imageHeight);

    for (int h = 0; h < imageHeight; h++) {
      int uvh = (h / 2).floor();

      for (int w = 0; w < imageWidth; w++) {
        int uvw = (w / 2).floor();

        final yIndex = (h * yRowStride) + (w * yPixelStride);

        // Y plane should have positive values belonging to [0...255]
        final int y = yBuffer[yIndex];

        // U/V Values are subsampled i.e. each pixel in U/V chanel in a
        // YUV_420 image act as chroma value for 4 neighbouring pixels
        final int uvIndex = (uvh * uvRowStride) + (uvw * uvPixelStride);

        // U/V values ideally fall under [-0.5, 0.5] range. To fit them into
        // [0, 255] range they are scaled up and centered to 128.
        // Operation below brings U/V values to [-128, 127].
        final int u = uBuffer[uvIndex];
        final int v = vBuffer[uvIndex];

        // Compute RGB values per formula above.
        int r = (y + v * 1436 / 1024 - 179).round();
        int g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91).round();
        int b = (y + u * 1814 / 1024 - 227).round();

        r = r.clamp(0, 255);
        g = g.clamp(0, 255);
        b = b.clamp(0, 255);

        image.setPixelRgb(w, h, r, g, b);
      }
    }

    return image;
  }

  Future<XFile?> convertCameraImageToXFile(CameraImage cameraImage) async {
    // Get the directory to save the image
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String filePath = '${appDirectory.path}/camera_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    imglib.Image? image = convertYUV420ToImage(cameraImage);

    // Save the image as JPEG
    final List<int> jpeg = imglib.encodeJpg(image);
    final File file = File(filePath);
    await file.writeAsBytes(jpeg);
    print("conversion done");
    return XFile(file.path);
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
      // body: FutureBuilder<XFile?>(
      //   future: display,
      //   builder: (context, snapshot) {
      //     if (_frameBuffer.isNotEmpty) display = convertCameraImageToXFile(_frameBuffer[0]);
      //     //if (snapshot.connectionState == ConnectionState.done) {
      //     //  print("connection done");
      //       if (snapshot.hasData){
      //         print("DIU");
      //         final XFile? play = snapshot.data;
      //         return Image.file(File((play)!.path));
      //       }
      //     print("connection fk");
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
      body: FutureBuilder<XFile?>(
            future: _frameBuffer.isNotEmpty ? convertCameraImageToXFile(_frameBuffer[0]) : null,
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                    final XFile play = snapshot.data!;
                    return Image.file(File(play.path));
                }
                return Center(child: Text('No images captured.'));
            },
        ),
    );
  }
}

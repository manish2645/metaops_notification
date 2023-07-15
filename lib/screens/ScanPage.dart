import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'CropImagePage.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  late CameraController _controller;
  late Future<void> _initializeControllerFuture = Future.value();
  bool isCameraLoaded = false;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    _initializeControllerFuture = _controller.initialize();
    setState(() {
      isCameraLoaded = true;
    });
  }


  bool cameraLoading = false;
  bool cameraError = false;
  final picker = ImagePicker();

  List<File>? imageFiles = [];

  bool flash = false;
  void changeFlashMode() {
    setState(() {
      flash = !flash;
    });
    if (flash) {
      _controller.setFlashMode(FlashMode.torch);
    } else {
      _controller.setFlashMode(FlashMode.off);
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void clickImages() async {
    try {
      if (imageFiles != null && imageFiles!.length >= 3) {
        Fluttertoast.showToast(
          msg: "Only up to 3 images allowed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      final clickedImages = await _controller.takePicture();

      if (clickedImages != null) {
        setState(() {
          flash = false;
          _controller.setFlashMode(FlashMode.off);
          if (imageFiles == null) {
            imageFiles = [File(clickedImages.path)];
          } else {
            imageFiles!.add(File(clickedImages.path));
          }
        });
      }
    } catch (e) {
      print(e);
    }

    if (imageFiles != null) {
      _cropImages(imageFiles!.length - 1);
    }
  }


  List<File> croppedFiles = [];
  Future _cropImages(int currentIndex) async {
    final imageFile = imageFiles![currentIndex];
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: const Color(0x0033357d),
            toolbarWidgetColor: const Color(0x0033357d),
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          ),
        ]
    );

    if (croppedFile != null) {
      setState(() {
        croppedFiles.add(File(croppedFile.path));
      });
    }
  }


  Future _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();

    if (imageFiles!.length >= 3) {
      Fluttertoast.showToast(
        msg: "Only upto 3 images allowed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }
    if (pickedImages.isNotEmpty) {
      setState(() {
        imageFiles = pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 40, 40, 40)),
              ),
              const Text(
                "Scan",
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 40, 40),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Lato-Black',
                  fontSize: 18,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: changeFlashMode,
              icon: Icon(
                flash
                    ? Icons.flash_on
                    : Icons.flash_off,
                color: Colors.black,
              ),
            ),
          ]),
      body: SizedBox(
        width: double.infinity,
        child: Scaffold(
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          bottomSheet: Container(
            color: const Color.fromARGB(255, 40, 40, 40),
            child: SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Scan", style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255,),
                      fontFamily: 'Lato-Black',
                      fontSize: 16,
                      fontWeight: FontWeight.bold

                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _pickImages();
                          },
                          child: Image.asset('assets/scan_page_gallery_icon.png', height: 60)
                      ),
                      GestureDetector(
                          onTap: () async {
                            clickImages();
                          },
                          child: Image.asset('assets/scan_page_shutter_icon.png',height: 80,)
                      ),
                      GestureDetector(
                        onTap: () {
                          if(croppedFiles!=null){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CropImagesPage(
                                  imageFiles: croppedFiles,
                                ),
                              ),
                            );
                          }
                        },
                        child: Stack(
                          children: [
                            // Stacked Images
                            ...croppedFiles!.map((path) {
                              return Positioned(
                                child: Image.file(
                                  path,
                                  height: 80,
                                  width: 60,
                                ),
                              );
                            }),
                            // Circular Counters
                            ...List.generate(croppedFiles!.length, (index) {
                              return Positioned(
                                top: 0,
                                left: 0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/scap_page_eclipse_icon.png',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
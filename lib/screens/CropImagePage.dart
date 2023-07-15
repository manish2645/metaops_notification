import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class CropImagesPage extends StatefulWidget {
  final List<File>? imageFiles;

  const CropImagesPage({Key? key, required this.imageFiles}) : super(key: key);

  @override
  _CropImagesPageState createState() => _CropImagesPageState();
}

class _CropImagesPageState extends State<CropImagesPage> {
  int currentIndex = 0;

  void goToNextImage() {
    if (currentIndex < widget.imageFiles!.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }


  void _cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: widget.imageFiles![currentIndex].path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 800,
        maxHeight: 800,
        compressFormat: ImageCompressFormat.jpg,
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
        widget.imageFiles![currentIndex] = File(croppedFile.path);
      });
    }
  }

  Future<void> handleDone() async {
    Navigator.pushNamed(context, '/convert');
  }

  void handleRetake() async {
    File currentImage = widget.imageFiles![currentIndex];
    await currentImage.delete();

    widget.imageFiles![currentIndex] = File(currentImage.path);

    setState(() {});
    Navigator.pop(context);
  }

  void deleteImages() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text('Are you sure you want to delete this image?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Delete the image file
                File currentImage = widget.imageFiles![currentIndex];
                currentImage.deleteSync();

                widget.imageFiles!.removeAt(currentIndex);
                if (widget.imageFiles!.isEmpty) {
                  Navigator.pushNamed(context, '/scan');
                  setState(() {});
                } else {
                  if (currentIndex > 0) {
                    currentIndex--;
                  }else{
                    Navigator.pop(context);
                    setState(() {});
                  }
                }
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 40, 40, 40)),
            ),
            const Text(
              "Crop",
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
          GestureDetector(
            onTap: handleDone,
            child: Container(
              margin: const EdgeInsets.all(15),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 40, 40, 40)),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: const Color(0x0033357d),
              ),
              child: const Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 40, 40, 40),
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'Lato-Black',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.file(
                widget.imageFiles![currentIndex],
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 40, 40, 40)),
                  onPressed: goToPreviousImage,
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 40, 40, 40)),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Center(
                    child: Text(
                      '${currentIndex + 1}/${widget.imageFiles!.length}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 40, 40, 40),
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        fontFamily: 'Lato-Black',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 40, 40, 40)),
                  onPressed: goToNextImage,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: const Color.fromARGB(255, 40, 40, 40),
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Image.asset('assets/scan_page_retake_icon.png'),
                            onPressed: () {
                              handleRetake();
                            },
                          ),
                          const Text(
                            "Retake",
                            style: TextStyle(
                              fontFamily: 'Lato-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Image.asset('assets/crop_page_delete_icon.png'),
                              onPressed: (){
                                deleteImages();
                              }
                          ),
                          const Text(
                            "Delete",
                            style: TextStyle(
                              fontFamily: 'Lato-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Image.asset('assets/scan_page_crop_icon.png'),
                              onPressed:(){ _cropImage();}
                          ),
                          const Text(
                            "Crop",
                            style: TextStyle(
                              fontFamily: 'Lato-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

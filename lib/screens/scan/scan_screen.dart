import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:vvims/config/app_colors.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/home/scanned_visitor_details.dart';
import 'package:vvims/utils/functions.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, this.index, required this.title});

  final index;
  final String title;
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen>
    with SingleTickerProviderStateMixin {
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  late CameraController _controller;
  late TabController _tabController;

  int _selectedIndex = 0;
  String imageSide = 'Scan Front Id Card';
  Map<String, dynamic>? frontIdData;
  Map<String, dynamic>? backIdData;
  bool processing = true;

  @override
  void initState() {
    super.initState();
    initCamera();
    _selectedIndex = widget.index ?? 0;
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> initCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      processing = false;
    });
  }

  Future<void> extractText(File image) async {
    final inputImage = InputImage.fromFile(image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    setState(() {
      processing = false;
    });

    if (_selectedIndex == 0) {
      frontIdData = processExtractedText(text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScannedVisitorDetails(
              frontIdData: frontIdData,
            ),
          ));
    } else if (_selectedIndex == 1) {
      if (frontIdData == null) {
        frontIdData = processExtractedText(text);
        setState(() {
          imageSide = "Scan Back ID Card";
          processing = false;
        });
        showToast(message: "Scan Back Id", color: kSecondaryColor);
      } else {
        backIdData ??= processExtractedText(text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScannedVisitorDetails(
                frontIdData: frontIdData,
                backIdData: backIdData,
              ),
            ));
      }
    }
  }

  Map<String, dynamic> processExtractedText(String documentText) {
    List<String> lines = documentText.split('\n');
    Map<String, dynamic> splitTextMap = {};
    for (int i = 0; i < lines.length; i++) {
      String trimmedLine = lines[i].trim();
      splitTextMap[i.toString()] = trimmedLine;
    }
    return splitTextMap;
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: true,
          title: Text(widget.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 20,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff7B9CF6),
              Color(0xff184AD2),
            ])),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Expanded(
                child: _controller.value.isInitialized
                    ? CameraPreview(_controller)
                    : const Center(child: CircularProgressIndicator()),
              ),
              if (_selectedIndex == 1)
                Positioned(
                    top: 30,
                    right: 20,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          imageSide,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.white),
                        ))),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  color: kBlackColor,
                  child: Flexible(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              _buildListItem(0, "Passport"),
                              _buildListItem(1, "ID Card"),
                              _buildListItem(2, "Vehicle"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        cameraButton()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget cameraButton() {
    return InkWell(
      onTap: () async {
        final image = await _controller.takePicture();
        extractText(File(image.path));
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(100)),
        child: Container(
          margin: const EdgeInsets.all(kDefaultPadding / 5),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kBlackColor, borderRadius: BorderRadius.circular(100)),
          child: Container(
            margin: const EdgeInsets.all(kDefaultPadding / 4),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(100)),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(int index, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 3,
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? kSecondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Text(
              title,
              style: TextStyle(
                  color:
                      _selectedIndex == index ? kSecondaryColor : Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

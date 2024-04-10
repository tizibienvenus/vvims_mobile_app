
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vvims/constants/constants.dart';

class ScanScreen extends StatefulWidget{

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with SingleTickerProviderStateMixin{

  int _selectedIndex = 0;
  late TabController _tabController;
  late CameraController controller;
  late CameraDescription camera;
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Retrieve the list of available cameras
    final cameras = await availableCameras();

    // Use the first camera in the list
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.max, // Set the resolution preset to max
    );

    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //final cameras = await availableCameras();
  //final firstCamera = cameras.first;

  /* @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _initializeCamera();
    super.initState();
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  void _initializeCamera() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  controller = CameraController(
    firstCamera,
    ResolutionPreset.max, // Set the resolution preset to max
  );

  await controller.initialize();
  if (!mounted) {
    return;
  }
  setState(() {});
} 

 Future<void> initState() async {
  WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    camera = (await availableCameras()) as CameraDescription;
    _tabController = TabController(length: 3, vsync: this);
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

*/

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: kWhiteColor,
      appBar: buildAppBar(),
     // bottomNavigationBar: buildBottomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Expanded(
              child: Container(
                color: kErrorColor,
                child: _controller.value.isInitialized
                  ? CameraPreview(_controller)
                  : Center(child: CircularProgressIndicator()),
                      ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                color: kBlackColor,
                child: Flexible(
                  child: Column(
                   children: [
                    const SizedBox(height: kDefaultPadding / 2,),
                    TabBar(
                      labelColor: kSecondaryColor,
                      dividerColor: kErrorColor.withOpacity(0),
                      unselectedLabelColor: kWhiteColor,
                      controller: _tabController,
                      labelStyle: Theme.of(context).textTheme.labelMedium,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: -8.0,),
                      labelPadding: EdgeInsets.symmetric(vertical: kDefaultPadding / 3, horizontal: kDefaultPadding / 3),
                      tabAlignment: TabAlignment.center,
                      tabs: const [
                        Text("Passeport"),
                        Text("ID Card"),
                        Text("Vehicule")
                      ],
                      indicator: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: kSecondaryColor, // Couleur de l'indicateur
                            width: 3.0, // Epaisseur de l'indicateur
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 2,),
                    InkWell(
                      onTap: (){},
                      child: cameraButton(),
                    )
                   ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
   }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar buildAppBar(){
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: true,
      title: Text(
        "Scanner le Passeport / la ID Carte",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: kWhiteColor),
      ),
    );
  }


  BottomNavigationBar buildBottomAppBar(){
    return  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
     );
  }
  
  Container cameraButton(){
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding / 5),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Container(
        margin: EdgeInsets.all(kDefaultPadding / 4),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(100)
        ),
    ),
    ),
    );
  }
}
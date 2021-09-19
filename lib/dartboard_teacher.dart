import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'dart:io';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';


class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1>{

  late File imgFile;
  final imgPicker = ImagePicker();


  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Capture Image From Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
    setState(() {
      imgFile = File(imgCamera.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
    setState(() {
      imgFile = File(imgGallery.path);
    });
    Navigator.of(context).pop();
  }

  Widget displayImage(){
    if(imgFile == null){
      return Text("No Image Selected!");
    } else{
      return Image.file(imgFile, width: 350, height: 350);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/dashboard_bg.jpg'),
              fit: BoxFit.contain),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Dashboard'),
            backgroundColor: const Color(0xff006F73),
          ),
          drawer: Drawer(
            child: Container(
              color: const Color(0xff006F73),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const SizedBox(
                    height: 114.0,
                    child: DrawerHeader(
                      decoration: BoxDecoration(),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(Icons.logout, size: 36.0,
                          color: Colors.white),
                      ),
                      title: const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text('Logout', style: TextStyle(fontSize: 24.0, color: Colors.white)),
                      ),
                      onTap: () => {
                        Navigator.pushNamed(context, '/'),
                      }),
                ],
              ),
            ),
          ),
          extendBody: true,
          bottomNavigationBar: FloatingNavbar(
            backgroundColor: const Color(0xff3FBBBD),
            onTap: (int val) {
              switch (val) {
                case 0:
                  {
                    setState(() =>{Navigator.pushNamed(context, '/dashboard1')});
                  }
                  break;

                case 1:
                  {
                    setState(() =>{Navigator.pushNamed(context, '/Join')});
                  }
                  break;
                case 2:
                  {
                    setState(() =>{Navigator.pushNamed(context, '/RegisterTeacher')});
                  }
                  break;
                default:
                  {
                    print("HIIIIIIIIIIIIIIIIIIII");
                  }
                  break;
              }
            },
            currentIndex: 0,
            items: [
              FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              FloatingNavbarItem(icon: LineIcons.meetup, title: 'Meets',),
              FloatingNavbarItem(icon: LineIcons.excelFile, title: 'Attendance record'),
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 250.0),
                child: Container(
                  width: 384.0,
                  height: 200.0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        child: const Text(
                          'Hello!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        child: const Text(
                          'Welcome to the Dashboard!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff769E9E),
                    ),
                    //color: HexColor('#DFDC3B'),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    color: const Color(0xffA4F1F1),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.onPrimary,
                          spreadRadius: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyPickImageScreen(title: 'Flutter Image Picker Sample'),
//     );
//   }
// }

// class MyPickImageScreen extends StatefulWidget {
//   MyPickImageScreen({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyPickImageScreenState createState() => _MyPickImageScreenState();
// }

// class _MyPickImageScreenState extends State<MyPickImageScreen> {

//   File imgFile;
//   final imgPicker = ImagePicker();

//   Future<void> showOptionsDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Options"),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   GestureDetector(
//                     child: Text("Capture Image From Camera"),
//                     onTap: () {
//                       openCamera();
//                     },
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   GestureDetector(
//                     child: Text("Take Image From Gallery"),
//                     onTap: () {
//                       openGallery();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   void openCamera() async {
//     var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
//     setState(() {
//       imgFile = File(imgCamera.path);
//     });
//     Navigator.of(context).pop();
//   }

//   void openGallery() async {
//     var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
//     setState(() {
//       imgFile = File(imgGallery.path);
//     });
//     Navigator.of(context).pop();
//   }

//   Widget displayImage(){
//     if(imgFile == null){
//       return Text("No Image Selected!");
//     } else{
//       return Image.file(imgFile, width: 350, height: 350);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//            displayImage(),
//             SizedBox(height: 30),
//             RaisedButton(
//               onPressed: () {
//                 showOptionsDialog(context);
//               },
//               child: Text("Select Image"),
//             )
//           ],
//         ),
//       ),
//     );
//   }

// }
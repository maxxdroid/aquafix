import 'dart:io';
import 'package:aquafix/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MeterVerification extends StatefulWidget {
  final String meterNum;
  final String metername;
  final String password;
  const MeterVerification({super.key, required this.meterNum, required this.metername,required this.password});

  @override
  State<MeterVerification> createState() => _MeterVerificationState();
}

class _MeterVerificationState extends State<MeterVerification> {
  bool imageSelected = false;
  late File _pic;
  final picker = ImagePicker();

  Future _selectFromGallery() async{
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pic = File(tempImage!.path);
      imageSelected = true;
    });
  }

  Future _captureWithCamera () async {
    var tempImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pic = File(tempImage!.path);
      imageSelected = true;
    });
  }

  selectImage(ncontext) {
    return showDialog(
      context: ncontext, 
      builder: (c) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          title: const Text("Upload a Picture of a receipt"),
          children: [
            SimpleDialogOption(
              child: const Text("Select from Gallery"),
              onPressed: () {
                _selectFromGallery();
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text("Capture with camera"),
              onPressed: () {
                _captureWithCamera();
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:  EdgeInsets.only(left:30.0, top: 20, right: 30),
                        child: Text("Upload a Meter Receipt", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),)
                      ),
                    ),
                  Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 20, left: 30, right: 30, bottom: height * 0.1),
                    child: const Text("Make sure the image is clear and concise.", style: TextStyle(fontSize: 16,)),
                    ),
                ),
                SizedBox(
                height: height * 0.5,
                 child: imageSelected ? 
                   InkWell(
                    onTap: () {
                      selectImage(context);
                    },
                    // child: CircleAvatar(
                    //   radius: width * 0.5,
                    //   backgroundImage: FileImage(_pic),
                    // ),
                    child: Image.file(_pic),
                   )
                  :
                  IconButton(
                  iconSize: 200,
                  onPressed: () {
                    selectImage(context);
                  }, 
                  icon: const Icon(Icons.add_a_photo)
                  )
               ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, "home");
          AuthMethods().signUpWithEmailandPassword(widget.meterNum, widget.password, widget.password, context, _pic);
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple, backgroundColor: Colors.lightBlue),
        child: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
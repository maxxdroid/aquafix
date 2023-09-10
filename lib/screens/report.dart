import 'dart:io';

import 'package:aquafix/database/database.dart';
import 'package:aquafix/maps/user_add_map.dart'; 
import 'package:aquafix/widgets/loading_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Report extends StatefulWidget {
  const Report({super.key, required this.title});

  final String title;

  @override
  State<Report> createState() => _ReportState();
}

LatLng tapedpoint = const LatLng(5.590425, -0.202665);
bool isSelected = false;

selectedmap(bool tapped, LatLng newtapedpoint) {
  isSelected = tapped;
  tapedpoint = newtapedpoint;
}

class _ReportState extends State<Report> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _details = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  final String _location = '';

  bool imageSelected = false;
  late File _pic;
  final picker = ImagePicker();

  Future _selectFromGallery() async {
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pic = File(tempImage!.path);
      imageSelected = true;
    });
  }

  Future _captureWithCamera() async {
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text("Upload a picture of the Fault"),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 30.0, top: 40, right: 30, bottom: 0),
              child: Expanded(
                  child: Text(
                "Enter Details of the Fault",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              )),
            ),
            Container(
              height: height * 0.45,
              // width: width * 0.7,
              padding: const EdgeInsets.only(top: 30),
              child: imageSelected
                  ? InkWell(
                      onTap: () {
                        selectImage(context);
                      },
                      child: Image.file(_pic),
                    )
                  : IconButton(
                      onPressed: () {
                        selectImage(context);
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        size: 300,
                      )),
            ),
            const Text("Add an image of the fault"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 15, right: 15),
              child: TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 15, right: 15),
              child: TextFormField(
                controller: _phoneNumber,
                decoration: const InputDecoration(
                    prefix: Text("  +233"), labelText: "Phone Number"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid Phone Number';
                  } else if (value.length < 9) {
                    return 'Enter a valid Phone Number';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 10, left: 15, right: 15),
                child: Text("Tap to add the location")),
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const UserAddMap(),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 45.0, left: 15, right: 15),
                child: TextFormField(
                  controller: _details,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    labelText: "Descripton",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.5),
                    ),
                  ),
                  maxLines: 7,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a Description';
                    } else {
                      return null;
                    }
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 15, right: 15, bottom: 20),
              height: height * 0.1,
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  final FormState? form = _formKey.currentState;
                  // print(".......${tapedpoint!.latitude.toString()}.....");
                  if (form!.validate() & _pic.path.isEmpty) {
                    Map<String, dynamic> userReportMap = {
                      "Fault Type": widget.title,
                      "Name": _name.text.toString(),
                      "location": _location,
                      "Description": _details.text.toString(),
                      "Phone Number": _phoneNumber.text.toString(),
                      "Date": DateTime.now().toString(),
                      "Lat" : tapedpoint.latitude.toString(),
                      "Lng" : tapedpoint.longitude.toString(),
                    };

                    showDialog(
                        context: context,
                        builder: (_) {
                          return const LoadingAlert(
                            message: 'Sending Report please wait...',
                          );
                        });

                    await DataBaseMethods()
                        .addUserReport(userReportMap, tapedpoint)
                        .then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  } else if (form.validate() & _pic.path.isNotEmpty) {
                    Map<String, dynamic> userReportMap = {
                      "Fault Type": widget.title,
                      "Name": _name.text.toString(),
                      "location": _location,
                      "Description": _details.text.toString(),
                      "Phone Number": _phoneNumber.text.toString(),
                      "Date": DateTime.now().toString(),
                      "Lat" : tapedpoint.latitude.toString(),
                      "Lng" : tapedpoint.longitude.toString(),
                    };

                    showDialog(
                        context: context,
                        builder: (_) {
                          return const LoadingAlert(
                            message: 'Sending Report please wait...',
                          );
                        });

                    await DataBaseMethods()
                        .addUserReportWithImage(userReportMap, _pic, tapedpoint)
                        .whenComplete(() {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  }
                  // Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple,
                    backgroundColor: Colors.lightBlue),
                child: const Text(
                  "Submit Report",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

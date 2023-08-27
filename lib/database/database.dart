// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DataBaseMethods {
  addUserInfoToDob(String userId, Map<String, dynamic> userInfoMap, File meterImage, BuildContext context) {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    String ? downloadurl;
    uploadimage(meterImage, String dVariable) async {
    final Reference reference = FirebaseStorage.instance.ref().child('items');
    UploadTask storageUploadTask = reference.child('product_$dVariable .jpg').putFile(meterImage);
    TaskSnapshot taskSnapshot = await storageUploadTask;
    downloadurl = await taskSnapshot.ref.getDownloadURL();
     userInfoMap["Image Url"] = downloadurl;
    print("......................Y....................Uploading image");
  }

  uploadimage(meterImage, dVariable).whenComplete(() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
    Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, "home");
  });
  }


  Future addUserReport (Map<String, dynamic> userReportMap) async {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    return FirebaseFirestore.instance
        .collection("Reports")
        .doc(dVariable)
        .set(userReportMap);
    }

  Future addUserReportWithImage(Map<String, dynamic> userReportMap, File faultImage) async {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    String ? downloadurl;
    uploadimage(faultImage, String dVariable) async {
    final Reference reference = FirebaseStorage.instance.ref().child('items');
    UploadTask storageUploadTask = reference.child('product_$dVariable .jpg').putFile(faultImage);
    TaskSnapshot taskSnapshot = await storageUploadTask;
    downloadurl = await taskSnapshot.ref.getDownloadURL();
     userReportMap["Image Url"] = downloadurl;
    print("......................Y....................Uploading image");
  }
    // String url = uploadimage(faultImage, dVariable);

    uploadimage(faultImage, dVariable).whenComplete(()  {
      return FirebaseFirestore.instance
        .collection("Reports")
        .doc(dVariable)
        .set(userReportMap);
    });
  }

  Future<Stream<QuerySnapshot>> getChatroomMessages(userID) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .collection("chats")
        .orderBy("time", descending: true)
        .snapshots();
  }
}

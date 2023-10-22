import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../screen.dart';

class DataBaseMethods {
  addUserInfoToDob(String userId, Map<String, dynamic> userInfoMap,
      File meterImage, BuildContext context) {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    String? downloadurl;
    uploadimage(meterImage, String dVariable) async {
      final Reference reference = FirebaseStorage.instance.ref().child('items');
      UploadTask storageUploadTask =
          reference.child('product_$dVariable .jpg').putFile(meterImage);
      TaskSnapshot taskSnapshot = await storageUploadTask;
      downloadurl = await taskSnapshot.ref.getDownloadURL();
      userInfoMap["Image Url"] = downloadurl;
    }

    uploadimage(meterImage, dVariable).whenComplete(() {
      FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .set(userInfoMap);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, "screen");
    });
  }

  Future addUserReport(Map<String, dynamic> userReportMap,) async {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    String id = getId();
    storeData() {
      FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("reports")
        .doc(dVariable)
        .set(userReportMap);
      FirebaseFirestore.instance
        .collection("Reports")
        .doc(dVariable)
        .set(userReportMap);
    }
    return storeData();
  }

  Future addUserReportWithImage(
    Map<String, dynamic> userReportMap, File faultImage,) async {
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
    String? downloadurl;
    uploadimage(faultImage, String dVariable) async {
      final Reference reference = FirebaseStorage.instance.ref().child('items');
      UploadTask storageUploadTask =
          reference.child('product_$dVariable .jpg').putFile(faultImage);
      TaskSnapshot taskSnapshot = await storageUploadTask;
      downloadurl = await taskSnapshot.ref.getDownloadURL();
      userReportMap["Image Url"] = downloadurl;
    }
    String id = getId();
    storeData() {
      FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("reports")
        .doc(dVariable)
        .set(userReportMap);
      FirebaseFirestore.instance
        .collection("Reports")
        .doc(dVariable)
        .set(userReportMap);
    }

    uploadimage(faultImage, dVariable).whenComplete(() {
      return storeData();
    });
  }
}

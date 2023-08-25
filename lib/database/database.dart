// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataBaseMethods {
  Future addUserInfoToDob(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  uploadimage(faultImage, String dVariable) async {
    final Reference reference = FirebaseStorage.instance.ref().child('items');
    UploadTask storageUploadTask = reference.child('product_$dVariable .jpg').putFile(faultImage);
    TaskSnapshot taskSnapshot = await storageUploadTask;
    String downloadurl = await taskSnapshot.ref.getDownloadURL();
    return downloadurl;
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
    String url = uploadimage(faultImage, dVariable);
    userReportMap["Image Url"] = url;
    return FirebaseFirestore.instance
        .collection("Reports")
        .doc(dVariable)
        .set(userReportMap);
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

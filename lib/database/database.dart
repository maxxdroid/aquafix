// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  String dVariable = DateTime.now().microsecondsSinceEpoch.toString();

  Future addUserInfoToDob(String userId, Map<String, dynamic>userInfoMap) {
    return FirebaseFirestore.instance.collection("users").doc(userId).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getChatroomMessages(userID) async {
    return FirebaseFirestore.instance.collection("users").doc(userID)
    .collection("chats")
    .orderBy("time", descending: true)
    .snapshots();
  }
}
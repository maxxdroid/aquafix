// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future addUserInfoToDob(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addUserReportInfoToDob(Map<String, dynamic> userReportMap) {
    print("Weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    String dVariable = DateTime.now().microsecondsSinceEpoch.toString();
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

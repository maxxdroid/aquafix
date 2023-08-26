import 'dart:io';

import 'package:aquafix/admin/admin_home.dart';
import 'package:aquafix/database/database.dart';
import 'package:aquafix/widgets/loading_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  signInWithEmailandPAssword(
      String meterNumber, String password, BuildContext context) async {
      showDialog(
        context: context,
        builder: (_) {
          return const LoadingAlert(
            message: 'Logging in please wait...',
          );
        });
    // late User? firebseUser;
    String email = "$meterNumber@gmail.com";
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((authUser) {
      // firebseUser = authUser.user;
      // readLogInData(firebseUser!);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.popAndPushNamed(context, "home");
    }).onError((error, stackTrace) {
      Navigator.of(context);
      // logInErrorHandling(error.toString());
    });
  }

  logOutUser() {
    auth.signOut();
  }

  signUpWithEmailandPassword(String meterNum, String password, String name,
      BuildContext context, File meterImage) async {
    String mail = "$meterNum@gmail.com";

    late User? firebaseUser;

    showDialog(
        context: context,
        builder: (_) {
          return const LoadingAlert(
            message: 'Registering please wait...',
          );
        });

    await auth
        .createUserWithEmailAndPassword(email: mail, password: password)
        .then((authUser) {
      firebaseUser = authUser.user;

      // String userName = email.replaceAll("@gmail.com", "");

      // SharedPrefHelper().saveUserEmail(email);
      // SharedPrefHelper().saveUserID(firebaseUser!.uid);
      // SharedPrefHelper().saveUserDisplayName(name);
      // SharedPrefHelper().saveUserName(userName);

      Map<String, dynamic> userInfoMap = {
        "Email": mail,
        "Name": name,
        "imgUrl": "",
        "Meter Number": meterNum
      };

      DataBaseMethods()
          .addUserInfoToDob(firebaseUser!.uid, userInfoMap, meterImage)
          .then((value) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, "home");
      });
    }).onError((error, stackTrace) {
      // signUpErrorHandling(error.toString());
    });
  }

  loginAdmin(String id, String password, BuildContext context) async {
    var collection = FirebaseFirestore.instance.collection('Admin');
    collection.doc('users').snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data()!;
        var id0 = data['id'];
        var password0 = data['password'];
        if (id0 == id && password0 == password) {
          Route route = MaterialPageRoute(builder: (_) => const AdminHome());
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(context, route);
        }
      }
    });
  }

  signUpErrorHandling(error) {
    switch (error) {
      case "[firebase_auth/email-already-in-use] The email address is already in use by another account.":
        // case "email-already-in-use":
        Fluttertoast.showToast(msg: "Email already used. Go to login page.");
        break;
      // return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        Fluttertoast.showToast(msg: "Wrong email/password combination.");
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        Fluttertoast.showToast(msg: "No user found with this email.");
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        Fluttertoast.showToast(msg: "User disabled.");
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        Fluttertoast.showToast(
            msg: "Too many requests to log into this account.");
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        Fluttertoast.showToast(msg: "Server error, please try again later.");
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        Fluttertoast.showToast(msg: "Email address is invalid.");
        break;
      default:
        Fluttertoast.showToast(msg: "Sign up error try again later");
        break;
    }
  }
}

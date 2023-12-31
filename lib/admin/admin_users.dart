import 'package:aquafix/admin/user_details.dart';
import 'package:aquafix/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminUserControl extends StatefulWidget {
  const AdminUserControl({super.key});

  @override
  State<AdminUserControl> createState() => _SubmittedReportsState();
}

class _SubmittedReportsState extends State<AdminUserControl> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Users",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          // backgroundColor: Colors.lightBlueAccent.shade100,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (content, index) {
                          UserModel model = UserModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return reportCard(model, content);
                        })
                    : const Center(
                        child: Text("No Reports Yet"),
                      );
              }),
        ));
  }

  reportCard(UserModel model, BuildContext context) {
    return InkWell(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (c) => UserDetails(model: model));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            child: SizedBox(
          // width: width * 8,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.userName ?? ""),
                    // Text(model.faultType ?? "")
                  ],
                ),
                Text(model.location ?? "")
              ],
            ),
          ),
        )),
      ),
    );
  }
}

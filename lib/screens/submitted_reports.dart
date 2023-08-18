import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubmittedReports extends StatefulWidget {
  const SubmittedReports({super.key});

  @override
  State<SubmittedReports> createState() => _SubmittedReportsState();
}

class _SubmittedReportsState extends State<SubmittedReports> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Submitted Reports.",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ),
          // backgroundColor: Colors.lightBlueAccent.shade100,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Reports').snapshots(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (content, index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                                child: Container(
                              // width: width * 8,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [Text(ds["Name"]), Text(ds["Fault Type"])],
                                    ),
                                    Text(ds["location"])
                                  ],
                                ),
                              ),
                            )),
                          );
                        })
                    : const Center(
                        child: Text("No Reports Yet"),
                      );
              }),
        ));
  }
}

import 'package:aquafix/authentication/auth.dart';
import 'package:aquafix/models/report_model.dart';
import 'package:aquafix/screens/report_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import '../screen.dart';

class SubmittedReports extends StatefulWidget {
  const SubmittedReports({super.key});

  @override
  State<SubmittedReports> createState() => _SubmittedReportsState();
}

class _SubmittedReportsState extends State<SubmittedReports> {

  String id = AuthMethods().auth.currentUser!.uid;

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
          padding: const EdgeInsets.only(top: 20.0),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").doc(id).collection("reports").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError){
                  return const Center(
                        child: Text("No Reports Yet"),
                      );
                } 
                  return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (content, index) {
                          ReportModel model = ReportModel.fromJson(
                              snapshot.data!.docs[index].data());
                          return reportCard(model, content);
                        })
                    : const Center(
                        child: Text("No Reports Yet"),
                      );
                
              }
              ),
        )
        );
  }

  reportCard(ReportModel model, BuildContext context) {
    return InkWell(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (c) => ReportDetails(model: model));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
            child: SizedBox(
          // width: width * 8,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.userName ?? ""),
                    Text(model.faultType ?? "")
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

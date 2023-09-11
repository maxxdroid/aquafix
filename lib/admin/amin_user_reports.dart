import 'package:aquafix/models/report_model.dart';
// import 'package:aquafix/screen.dart';
import 'package:aquafix/screens/report_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubmittedUserReports extends StatefulWidget {
  final String id;
  const SubmittedUserReports({required this.id, super.key});

  @override
  State<SubmittedUserReports> createState() => _SubmittedUserReportsState();
}

class _SubmittedUserReportsState extends State<SubmittedUserReports> {

  String id = '';

  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("users").doc(id).collection("reports").snapshots(),
            builder: (context, snapshot) {
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
            );
  }


  reportCard(ReportModel model, BuildContext context) {
    return InkWell(
      onTap: () {
        // Route route =
        //     MaterialPageRoute(builder: (c) => ReportDetails(model: model));
        // Navigator.push(context, route);
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
// import 'package:aquafix/admin/amin_user_reports.dart';
import 'package:aquafix/models/report_model.dart';
import 'package:aquafix/models/users_model.dart';
import 'package:aquafix/screens/report_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final UserModel model;
  const UserDetails({super.key, required this.model});

  @override
  State<UserDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<UserDetails> {
  UserModel? model;
  String id = '';

  @override
  void initState() {
    super.initState();
    model = widget.model;
    id = widget.model.userId!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            model!.userName ?? "",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 400,
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Image.network(model!.userImage ?? "", fit: BoxFit.fitHeight,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Row(
                  children: [
                    const Text(
                      "User Id: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      model!.userId ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    const Text(
                      "Meter Number: ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      model!.meterNumber ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Reports from ${model!.userName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              StreamBuilder(
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
            ),
  
            ],
          ),
        ));
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

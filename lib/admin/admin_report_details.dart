import 'package:aquafix/admin/admin_view_map.dart';
import 'package:aquafix/models/report_model.dart';
import 'package:flutter/material.dart';

class AdminReportDetails extends StatefulWidget {
  final ReportModel model;
  const AdminReportDetails({super.key, required this.model});

  @override
  State<AdminReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<AdminReportDetails> {
  ReportModel? model;

  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model!.faultType ?? "",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 400,
              width: width,
              height: height * 0.4,
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Image.network(model!.faultImage ?? "" , fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  const Text("Location: ", style:
                        TextStyle(fontSize: 18,  ),),
                  Text(
                    model!.location ?? "",
                    style:
                        const TextStyle(fontSize: 18,  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  const Text("Date: ", style:
                        TextStyle(fontSize: 18,  ),),
                  Text(
                    model!.date ?? "",
                    style:
                        const TextStyle(fontSize: 18,  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  const Text("Phone number: 0", style:
                        TextStyle(fontSize: 18,  ),),
                  Text(
                    model!.userPhoneNumber ?? "",
                    style:
                        const TextStyle(fontSize: 18,  ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  const Text("location: ", style:
                        TextStyle(fontSize: 18,  ),),
                  Text(
                    model!.location ?? "",
                    style:
                        const TextStyle(fontSize: 18,  ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 300,
              child: AdminViewMap(lat: double.parse(model!.lat ?? ""), long: double.parse(model!.long ?? ""),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  const Text("Description: ", style:
                        TextStyle(fontSize: 18,  ),),
                  Text(
                    model!.description ?? "",
                    style:
                        const TextStyle(fontSize: 18,  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) 
    );
  }
}

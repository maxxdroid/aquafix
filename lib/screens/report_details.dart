import 'package:aquafix/maps/gmap.dart';
import 'package:aquafix/maps/map_snippet.dart';
import 'package:aquafix/models/report_model.dart';
import 'package:flutter/material.dart';

class ReportDetails extends StatefulWidget {
  final ReportModel model;
  const ReportDetails({super.key, required this.model});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}


class _ReportDetailsState extends State<ReportDetails> {
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
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: [
                  const Text("Location:     ", style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
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
              child: const MapSnippet(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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

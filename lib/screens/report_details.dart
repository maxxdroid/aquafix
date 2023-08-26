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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model!.faultType ?? "",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.network(model!.faultImage ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                model!.location ?? "",
                style:
                    const TextStyle(fontSize: 18,  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                model!.description ?? "",
                style:
                    const TextStyle(fontSize: 18,  ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

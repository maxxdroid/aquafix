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
        title:  Text(model!.faultType ?? ""),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
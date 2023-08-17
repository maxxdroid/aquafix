import 'package:flutter/material.dart';

class SubmittedReports extends StatefulWidget {
  const SubmittedReports({super.key});

  @override
  State<SubmittedReports> createState() => _SubmittedReportsState();
}

class _SubmittedReportsState extends State<SubmittedReports> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Submitted Reports"),
      ),
    );
  }
}
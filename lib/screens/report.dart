import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key,required this.title});

  final String title;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 40, right: 30, bottom: 0),
            child: Expanded(
                child: Text(
              "Enter Details of the Fault",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            )),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10, left: 30, right: 10),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: "Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10, left: 30, right: 10),
              child: TextField(
                controller: _location,
                decoration: const InputDecoration(
                  labelText: "Location"
                ),
              ),
            ),
            Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15),
                    child: TextFormField(
                      controller: _details,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Descripton",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                      maxLines: 7,
                    )),
          ],
        )
      ),
    );
  }
}
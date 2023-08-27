import 'package:aquafix/models/users_model.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final UserModel model;
  const UserDetails({super.key, required this.model});

  @override
  State<UserDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<UserDetails> {
  UserModel? model;

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
            model!.userName ?? "",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Image.network(model!.userImage ?? ""),
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
              )
            ],
          ),
        ));
  }
}

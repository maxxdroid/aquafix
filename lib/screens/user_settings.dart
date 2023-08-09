import 'package:aquafix/authentication/auth.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        TextButton(
            onPressed: () {
              AuthMethods().logOutUser();
              Navigator.pushNamed(context, "signup");
            },
            child: const Text("Log Out"))
      ],
    ));
  }
}

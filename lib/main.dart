import 'package:flutter/material.dart';
import './authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import './authentication/signup/create_account.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400),
        useMaterial3: true,
      ),
      home: const SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import './authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/home.dart';
import './authentication/signup/create_account.dart';
import './authentication/signup/meter_verification.dart';

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
      routes: {
        "home" : (context) => const HomePage(),
        "login" : (context) => const SignIn(),
        "signup" : (context) => const CreateAccount(),
        "meter_verification" : (context) => const MeterVerification(),
        "signIn" : (context) => const SignIn(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade400),
        useMaterial3: true,
      ),
      home: const SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}


import 'package:aquafix/authentication/auth.dart';
import 'package:flutter/material.dart';
// import './auth.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _SignInState();
}

class _SignInState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _adminIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.1, bottom: 20, left: width * 0),
                  child: const Text(
                    "Acquafix",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Image.asset("assets/images/glogo.png"),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15),
                    child: TextFormField(
                      validator: (val) {
                        if (_adminIdController.text.isEmpty) {
                          return "Field cannot be empty";
                        }
                        return null;
                      },
                      controller: _adminIdController,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Admin Id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15, bottom: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (val) {
                        if (_passwordController.text.isEmpty) {
                          return "Field cannot be empty";
                        } else if (_passwordController.text.length < 8) {
                          return "Password cannot be less that 8 characters";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 15, right: 15, bottom: 20),
                  height: height * 0.1,
                  width: width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      final FormState? form = _formKey.currentState;
                      if (form!.validate()){
                        AuthMethods().signInWithEmailandPAssword(_adminIdController.toString().trim(), _passwordController.text.trim(), context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.lightBlue),
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ))),
      ),
    );
  }
}

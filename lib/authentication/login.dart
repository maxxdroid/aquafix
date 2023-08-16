import 'package:aquafix/admin/admin_login.dart';
import 'package:aquafix/authentication/auth.dart';
import 'package:flutter/material.dart';
// import './auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _meterNumController = TextEditingController();

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
                // Padding(
                //     padding: EdgeInsets.only(left: width * 0),
                //     child: const Text(
                //       "Welcome back",
                //       style: TextStyle(fontSize: 30),
                //     )),
                SizedBox(
                  height: height * 0.2,
                  child: Image.asset("assets/images/glogo.png"),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15),
                    child: TextFormField(
                      controller: _meterNumController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (_meterNumController.text.isEmpty) {
                          return "Field cannot be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Meter Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text(
                          "forgot your password?",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 15, right: 15, bottom: 20),
                  height: height * 0.1,
                  width: width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      final FormState? form = _formKey.currentState;
                      if (form!.validate()){
                        AuthMethods().signInWithEmailandPAssword(_meterNumController.text.toString().trim(), _passwordController.text.trim(), context);
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0, left: 20),
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                    ),
                    Text("OR"),
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 8),
                      child: Divider(
                        height: 2,
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "signup");
                        },
                        child: const Text("Resgister"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Are you an admin?"),
                    TextButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (_) => const AdminLogin());
                          Navigator.push(context, route);
                        },
                        child: const Text("Log in"))
                  ],
                )
              ],
            ))),
      ),
    );
  }
}

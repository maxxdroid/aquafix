import 'package:aquafix/authentication/signup/meter_verification.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _meterNumberController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _meterNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: height,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 30, right: 30),
                      child: Expanded(
                          child: Text(
                        "Enter your Meter number and create a Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 10),
                    child: TextFormField(                      
                      autofocus: true,
                      validator: (val) {
                        if (_meterNumberController.text.isEmpty) {
                          return "Field cannot be empty";
                        }
                        return null;
                      },
                      controller: _meterNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        // prefixText: '@',
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Meter Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 10),
                    child: TextFormField(
                      autofocus: true,
                      validator: (val) {
                        if (_meterNameController.text.isEmpty) {
                          return "Field cannot be empty";
                        }
                        return null;
                      },
                      controller: _meterNameController,
                      decoration: InputDecoration(
                        // prefixText: '@',
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Name on meter",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                    child: TextFormField(
                      autofocus: true,
                      obscureText: _obscure,
                      validator: (val) {
                        if (_passwordController.text.isEmpty) {
                          return "Field cannot be empty";
                        } else if (_passwordController.text.length < 8) {
                          return "Password cannot be less that 8 characters";
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _obscure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              if (_obscure) {
                                _obscure = false;
                              } else {
                                _obscure = true;
                              }
                            });
                          },
                        ),
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
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                    child: TextFormField(
                      autofocus: true,
                      obscureText: _obscure,
                      validator: (val) {
                        if (_confirmPasswordController.text.isEmpty) {
                          return "Field cannot be empty";
                        } else if (_confirmPasswordController.text.length < 8) {
                          return "Password cannot be less that 8 characters";
                        } else if (_confirmPasswordController.text !=
                            _passwordController.text) {
                          return "Passwords do not match";
                        } else {
                          return null;
                        }
                      },
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _obscure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              if (_obscure) {
                                _obscure = false;
                              } else {
                                _obscure = true;
                              }
                            });
                          },
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 14,
                        ),
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, "meter_verification");
          final FormState? form = _formKey.currentState;
          if (form!.validate()) {
            Route route = MaterialPageRoute(
                builder: (c) => MeterVerification(
                      meterNum: _meterNumberController.text.toString(),
                      metername: _meterNameController.text.toString().trim(),
                      password: _passwordController.text.toString().trim(),
                    ));
            Navigator.push(context, route);
          }
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple, backgroundColor: Colors.lightBlue),
        child: const Text(
          "Next",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

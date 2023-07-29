import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20, right: 30),
                    child: Expanded(
                        child: Text(
                      "Enter a username and Password",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    autofocus: true,
                    validator: (val) {
                      if (_usernameController.text.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixText: '@',
                      labelStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      labelText: "Username",
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
                      padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                      child: TextFormField(
                        autofocus: true,
                        obscureText: _obscure,
                        validator: (val) {
                          if (_passwordController.text.isEmpty ) {
                            return "Field cannot be empty";
                          }
                          else if (_passwordController.text.length < 8) {
                            return "Password cannot be less that 8 characters";
                          }
                          else {
                            return null;
                          }
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _obscure ? const Icon(Icons.visibility_off): const Icon(Icons.visibility), 
                            onPressed: (){
                              setState(() {
                                if (_obscure) {
                                  _obscure = false;
                                }
                                else{
                                  _obscure = true;
                                }
                              });
                            },),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          labelText: "Password",
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

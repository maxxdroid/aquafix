import 'package:flutter/material.dart';
// import './auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // height: 700,
            padding: const EdgeInsets.all(10),
            child: Form(
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
                  height: height *0.2,
                  child: Image.asset("assets/images/glogo.png"),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, left: 15, right: 15),
                    child: TextFormField(
                      controller: _emailController,
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
                    padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 20),
                    height: height * 0.1,
                    width: width * 0.6,
                    child: ElevatedButton(
                      onPressed: (){
                        // final FormState? form = _formKey.currentState;
                        // if (form!.validate()){
                        //   AuthMethods().signInWithEmailandPAssword(_emailController.toString().trim(), _passwordController.text.trim(), context);
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple, backgroundColor: Colors.lightBlue
                      ), 
                      child: const Text("Log In", style: TextStyle(color: Colors.white, fontSize: 16),),
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
                          padding:  EdgeInsets.only(right: 20.0, left: 8),
                          child: Divider(
                                height: 2,
                            color: Colors.black,
                          thickness: 0.5,
                     ),
                        )
                      ),
                    ],
                  ),
                Container(
                    padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                    height: height * 0.1,
                    width: width * 0.6,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // AuthMethods().signInWithGoogle(context);
                        // showDialog(
                        //    context: context,
                        //     builder: (_) {
                        //       return const LoadingAlert(
                        //              message: 'Signing in with google',
                        //               );
                        //        });
                      }, 
                      icon: Image.asset(
                        fit: BoxFit.contain,
                        width: 40,
                        "assets/images/logo.png"
                        ), 
                      label: const Text('Sign in with Google'),
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "signup");
                        }, 
                        child: const Text("Resgister")
                        )
                    ],
                  )
              ],
            ))),
      ),
    );
  }
}

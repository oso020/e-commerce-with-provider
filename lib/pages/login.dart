// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/pages/Forget_password.dart';

import 'package:flower_app/pages/register.dart';

import 'package:flower_app/provider/google_sign_in.dart';
import 'package:flower_app/shared/SnackBar.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flower_app/shared/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController1 = TextEditingController();
  final passwordController2 = TextEditingController();
   bool isLoading = false;

  bool is_Visiblity = true;

  login() async {
      setState(() {
      isLoading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController1.text, password: passwordController2.text);
      // ignore: use_build_context_synchronously
      showSnackBar(context, "Done...");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    }
      setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController1.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final google_Sign = Provider.of<GoogleSignInProvider>(context);
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: Text("Sign-in"),
        ),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    TextField(
                        controller: emailController1,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                            hintText: "Enter Your Email : ",
                            suffixIcon: Icon(Icons.email))),
                    const SizedBox(
                      height: 33,
                    ),
                    TextField(
                        controller: passwordController2,
                        keyboardType: TextInputType.text,
                        obscureText: is_Visiblity,
                        decoration: decorationTextfield.copyWith(
                            hintText: "Enter Your Password : ",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    is_Visiblity = !is_Visiblity;
                                  });
                                },
                                icon: Icon(is_Visiblity
                                    ? Icons.visibility_off
                                    : Icons.visibility)))),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await login();
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 19),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(BTNgreen),
                        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          );
                        },
                        child: Text(
                          "Forget-Password?",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?",
                            style: TextStyle(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()),
                              );
                            },
                            child:isLoading?CircularProgressIndicator(
                              color: Colors.white,
                            ): Text('sign up',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 18))),
                      ],
                    ),
                    
                    
                    SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                      width: 299,
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.6,
                          )),
                          Text(
                            "OR",
                            style: TextStyle(),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.6,
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 27),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              google_Sign.googlelogin();
                            },
                            child: Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: SvgPicture.asset(
                                "assets/img/google.svg",
                                height: 27,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}

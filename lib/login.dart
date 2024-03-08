import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usercontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var userfocusnode = FocusNode();
  var passfocusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "images/OIP.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Positioned(
            top: 130,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                boxShadow: [
                  const BoxShadow(color: Colors.black26, blurRadius: 40)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50, top: 40),
                      child: Text("Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: TextField(
                          focusNode: userfocusnode,
                          controller: usercontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outlined,
                                color: Colors.green,
                              ),
                              hintText: "UserName",
                              hintStyle: TextStyle(color: Colors.green)),
                          onSubmitted: (value) {
                            if (usercontroller.text.toString().isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Username");
                            } else {
                              passfocusnode.requestFocus();
                            }
                            ;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextField(
                        obscureText: true,
                        focusNode: passfocusnode,
                        controller: passcontroller,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              if (usercontroller.text.toString().isEmpty) {
                                userfocusnode.requestFocus();
                                Fluttertoast.showToast(msg: "Enter username");
                              } else if (passcontroller.text
                                  .toString()
                                  .isEmpty) {
                                passfocusnode.requestFocus();
                                Fluttertoast.showToast(msg: "Enter password");
                              } else if (passcontroller.text.length < 6) {
                                passfocusnode.requestFocus();
                                Fluttertoast.showToast(
                                    msg: "Password should be minimum 6 digits");
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Login Successfully");
                              }
                            },
                            child: Icon(
                              Icons.arrow_circle_right,
                              color: Colors.green,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupScreren()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.green),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}

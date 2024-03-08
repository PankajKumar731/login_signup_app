import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreren extends StatefulWidget {
  const SignupScreren({super.key});

  @override
  State<SignupScreren> createState() => _SignupScrerenState();
}

class _SignupScrerenState extends State<SignupScreren> {
  var usercontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var userfocusnode = FocusNode();
  var emailfocusnode = FocusNode();
  var mobilefocusnode = FocusNode();
  var passfocusnode = FocusNode();

  void checkValidations() {
    if (usercontroller.text.toString().isEmpty) {
      userfocusnode.requestFocus();
      Fluttertoast.showToast(msg: "Enter Username");
    } else if (emailcontroller.text.toString().isEmpty) {
      emailfocusnode.requestFocus();
      Fluttertoast.showToast(msg: "Enter email");
    } else if (mobilecontroller.text.toString().isEmpty) {
      mobilefocusnode.requestFocus();
      Fluttertoast.showToast(msg: "Enter mobile Number");
    } else if (passcontroller.text.toString().isEmpty) {
      passfocusnode.requestFocus();
      Fluttertoast.showToast(msg: "Enter password");
    } else {
      Fluttertoast.showToast(msg: "Sigup successfully");
    }
  }

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
              width: 400,
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
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
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
                            if (value.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Username");
                              userfocusnode.requestFocus();
                            } else {
                              emailfocusnode.requestFocus();
                            }
                            ;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextField(
                          focusNode: emailfocusnode,
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              hintText: "E-mail",
                              hintStyle: TextStyle(color: Colors.black)),
                          onSubmitted: (value) {
                            if (value.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter E-mail");
                            } else {
                              mobilefocusnode.requestFocus();
                            }
                            ;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextField(
                          focusNode: mobilefocusnode,
                          controller: mobilecontroller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              hintText: "Mobile No.",
                              hintStyle: TextStyle(color: Colors.black)),
                          onSubmitted: (value) {
                            if (value.isEmpty) {
                              Fluttertoast.showToast(msg: "Mobile No.");
                            } else {
                              passfocusnode.requestFocus();
                            }
                            ;
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: TextField(
                          focusNode: passfocusnode,
                          controller: passcontroller,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.black,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black)),
                          onSubmitted: (value) {
                            if (value.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Password");
                              passfocusnode.requestFocus();
                            } else {
                              checkValidations();
                            }
                            ;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // TextButton(
                          //   onPressed: null,
                          //   child: Text(
                          //     "Forgot Password?",
                          //     style: TextStyle(color: Colors.black),
                          //   ),
                          // ),
                          // Spacer(),
                          InkWell(
                            onTap: () {
                              checkValidations();
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
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Sign In",
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

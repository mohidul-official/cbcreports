import 'dart:convert';

import 'package:cbcreports/users/authentication/login_screen.dart';
import 'package:cbcreports/users/model/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formKey = GlobalKey<FormFieldState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var isObsecure = true.obs;
  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateemail),
        body: {
          'email': emailController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);
        if (resBodyOfValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(
              msg: "Email is Already In Use. Try Another Email");
        } else {
          // register new record
          saveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveUserRecord() async {
    User userModel = User(
      1,
      emailController.text.trim(),
      passwordController.text.trim(),
      nameController.text.trim(),
    );
    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson(),
      );
      if (res.statusCode == 200) {
        var resBodyOfSignup = jsonDecode(res.body);
        if (resBodyOfSignup['success'] == true) {
          Fluttertoast.showToast(msg: "Resgister Successfully");
          setState(() {
            nameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        } else {
          Fluttertoast.showToast(msg: "Error: Try Again");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 230, 0),
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //login screen header
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset(
                      "images/loginlogo.jpg",
                    ),
                  ),

                  // sign in form
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 92, 86, 86),
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  //name
                                  TextFormField(
                                    controller: nameController,
                                    validator: (val) => val == ""
                                        ? "Please write Your Name"
                                        : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      hintText: "Your Name...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //email
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) =>
                                        val == "" ? "Please write Email" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      hintText: "Email...",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //Password
                                  Obx(
                                    () => TextFormField(
                                      controller: passwordController,
                                      obscureText: isObsecure.value,
                                      validator: (val) => val == ""
                                          ? "Please write Password"
                                          : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              isObsecure.value =
                                                  !isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        hintText: "Password...",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //Button
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {
                                        if (emailController.text.trim() == "" ||
                                            passwordController.text.trim() ==
                                                "" ||
                                            nameController.text.trim() == "") {
                                          Fluttertoast.showToast(
                                              msg: "Error: Fill All Fields");
                                        } else {
                                          validateUserEmail();
                                        }
                                        //print(emailController.text.trim());

                                        //saveUserRecord();
                                        /*if (formKey.currentState!.validate()) {
                                          //validate email
                                          validateUserEmail();
                                        }*/
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "Register Now",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  Text(
                                    "Already have An Account",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //Register Button
                                  Material(
                                    color: Color.fromARGB(255, 0, 255, 34),
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(LoginScreen());
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          "Login Now",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

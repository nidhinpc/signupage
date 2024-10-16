import 'package:flutter/material.dart';
import 'package:signupage/controller/login_screen_controller.dart';
import 'package:signupage/view/home_screen/home_screen.dart';
import 'package:signupage/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreencontroller.initsharedPref();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Todo : write code  create controllers and form keys
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Sign in to Your Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // email input fied
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      hintText: "Your Eamil Address",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue.shade700,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                    ),
                    validator: (value) {
                      String pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      if (value != null && RegExp(pattern).hasMatch(value)) {
                        return null;
                      } else {
                        return "Enter a valid email";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  // password input field
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        hintText: "Your Password",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue.shade700,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade400,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red.shade400,
                            )),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            )),
                        suffixIcon: Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.grey,
                        )),
                    validator: (value) {
                      if (value != null && value.length < 8) {
                        return "Password must contain atleast 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 10,
                              ),
                            ),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Forgot password",
                        style: TextStyle(
                          color: Color(0xff1a75d2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await HomeScreencontroller.getdata();
                        final storedEmail = HomeScreencontroller.storedEmail;
                        final storedPass = HomeScreencontroller.storedPassword;
                        if (storedEmail == emailController.text &&
                            storedPass == passController.text) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: Container(
                                      width: double.infinity,
                                      child: Center(
                                          child: Text(
                                              "invalid password or username"))),
                                )
                              ],
                            ),
                          );
                        }
                      }
                      // Todo : write code  tonavigate to home screen on successful Login with registered credentials
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff1a75d2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            // Todo : write code  to navigate to registration screen

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => RegistrationScreen(),
                            //     ));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xff1a75d2),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

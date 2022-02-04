import 'package:flutter/material.dart';
import 'package:medchain/pages/admin/adminHome.dart';
import 'package:medchain/pages/doctor/doctorHome.dart';
import 'package:medchain/pages/patient/patientHome.dart';
import 'package:medchain/services/functions/authfunctions.dart';
import 'package:medchain/utils/colors.dart';
import 'package:medchain/utils/constants.dart';
import 'package:medchain/widgets/doctorImage.dart';

class Login extends StatefulWidget {
  final String user;
  const Login({Key? key, required this.user}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String username = '';
  bool signup = true;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: h! - 60,
          width: w,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    doctorImage('assets/images/doctor.png'),
                    // loginBox(signup ? l1 : l2),
                    SizedBox(
                      height: 20,
                    ),
                    signup
                        ? Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length == 0) {
                                  return 'Please Provide Username';
                                } else {
                                  return null;
                                }
                              },
                              key: ValueKey('name'),
                              onSaved: (value) {
                                setState(() {
                                  username = value!.trim();
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Enter Username',
                                // suffixIcon: Icon(Icons.person)
                              ),
                              cursorColor: AppColors.primary,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value!.length == 0) {
                            return 'Please Provide Email';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            email = value!.trim();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter Email',
                          // suffixIcon: Icon(Icons.email)
                        ),
                        cursorColor: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length == 0) {
                            return 'Please Provide Password';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        key: ValueKey('password'),
                        onSaved: (value) {
                          setState(() {
                            password = value!.trim();
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter Password',
                          focusColor: AppColors.primary,
                        ),
                        cursorColor: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          // style: buttonStyle,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => widget.user == 'admin'
                                        ? AdminHome()
                                        : widget.user == 'doctor'
                                            ? DoctorHome()
                                            : PatientHome()));
                            // if (_formkey.currentState!.validate()) {
                            //   _formkey.currentState!.save();
                            //   signup
                            //       ? signupUser(
                            //           email, password, username, context)
                            //       : signinUser(email, password, context);
                            // }
                          },
                          child: Text(
                            'Authenticate',
                            // style: TextStyle(color: Colors.black),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            signup = !signup;
                          });
                        },
                        child: Text(
                          signup
                              ? 'Already have an account? Login'
                              : "Don't have an account? SignUp",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

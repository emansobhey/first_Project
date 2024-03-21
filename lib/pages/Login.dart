import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/helper/showsnakbar.dart';
import 'package:project/pages/Signup.dart';
import 'package:project/pages/Welcome.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'Login page';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoad = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: SafeArea(
        child: Scaffold(
            body: SafeArea(
          child: Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Log in",
                            style:
                                TextStyle(fontSize: 33, fontFamily: "myfont"),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          SvgPicture.asset(
                            "assets/icons/login.svg",
                            width: 288,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.purple[800],
                                  ),
                                  hintText: "Your Email :",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffix: Icon(
                                    Icons.visibility,
                                    color: Colors.purple[900],
                                  ),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.purple[800],
                                    size: 19,
                                  ),
                                  hintText: "Password :",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                isLoad = true;
                                setState(() {});
                                try {
                                  await loginuser();
                                  Navigator.pushNamed(context, Welcome.id);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showsnakbar(context, 'user not found');
                                  } else if (e.code == 'invalid-credential') {
                                    showsnakbar(context, 'wrong password');
                                  }
                                } catch (e) {
                                  showsnakbar(context, e.toString());
                                }

                                isLoad = false;
                                setState(() {});
                              } else {}
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 106, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child: Text(
                              "login",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an accout? "),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, Signup.id);
                                  },
                                  child: Text(
                                    " Sign up",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: 111,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      width: 111,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}

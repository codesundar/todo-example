import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/screens/register.dart';
import 'package:todoapp/screens/reset.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  AuthController _auth = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _emailCtrl,
          ),
          TextField(
            controller: _passwordCtrl,
          ),
          TextButton(
            onPressed: () {
              _auth.loginWithEmailPassword(_emailCtrl.text, _passwordCtrl.text);
            },
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Get.to(RegisterScreen());
            },
            child: Text("Register"),
          ),
          TextButton(
            onPressed: () {
              Get.to(ResetPasswordScreen());
            },
            child: Text("Reset"),
          ),
          TextButton(
            onPressed: () {
              _auth.loginWithGoogle();
            },
            child: Text("Login with Google"),
          ),
        ],
      ),
    );
  }
}

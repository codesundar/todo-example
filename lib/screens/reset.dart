import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  TextEditingController _emailCtrl = TextEditingController();

  resetPassword() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: _emailCtrl.text
    )
        .then((value) {
      print("Password Sent");
      Get.to(HomeScreen());
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
          TextField(
            controller: _emailCtrl,
          ),
          
          TextButton(
            onPressed: () {
              resetPassword();
            },
            child: Text("Reset Password"),
          ),
        ],
      ),
    );
  }
}

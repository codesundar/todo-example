import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailCtrl.text,
      password: _passwordCtrl.text,
    )
        .then((value) {
      print("Login Success");
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
            controller: _nameCtrl,
          ),
          TextField(
            controller: _emailCtrl,
          ),
          TextField(
            controller: _passwordCtrl,
          ),
          TextButton(
            onPressed: () {
              register();
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth.dart';
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
  TextEditingController _mobileCtrl = TextEditingController();
  AuthController _auth = Get.put(AuthController());

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
          TextField(
            controller: _mobileCtrl,
          ),
          TextButton(
            onPressed: () {
              _auth.registerWithEmailPassword({
                "name": _nameCtrl.text,
                "email": _emailCtrl.text,
                "password": _passwordCtrl.text,
                "mobile": _mobileCtrl.text
              });
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}

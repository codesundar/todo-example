import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController _mobileCtrl = TextEditingController();

  register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailCtrl.text,
      password: _passwordCtrl.text,
    )
        .then((value) {
      print("Login Success");
      insertToFirestore();
      // Get.to(HomeScreen());
    }).catchError((e) {
      print(e);
    });
  }

  insertToFirestore() {
    // FirebaseFirestore.instance.collection("accounts").add({
    //   "uid": FirebaseAuth.instance.currentUser!.uid,
    //   "displayName": _nameCtrl.text,
    //   "email": _emailCtrl.text,
    //   "mobile": _mobileCtrl.text,
    //   "createdAt": FieldValue.serverTimestamp()
    // });
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("accounts").doc(uid).set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "displayName": _nameCtrl.text,
      "email": _emailCtrl.text,
      "mobile": _mobileCtrl.text,
      "createdAt": FieldValue.serverTimestamp()
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
          TextField(
            controller: _mobileCtrl,
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

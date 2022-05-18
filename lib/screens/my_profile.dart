import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/screens/login.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var userObj = {};
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(LoginScreen());
    });
  }

  getUserData() {
    FirebaseFirestore.instance
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((res) {
      setState(
        () {
          userObj = {"id": res.id, ...res.data()!};
          _nameCtrl.text = userObj['displayName'];
          _emailCtrl.text = userObj['email'];
          _mobileCtrl.text = userObj['mobile'];
        },
      );
    });
  }

  updateProfile() {
    FirebaseFirestore.instance
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "displayName": _nameCtrl.text,
      "mobile": _mobileCtrl.text,
      "email": _emailCtrl.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
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
            controller: _mobileCtrl,
          ),
          TextButton(
            onPressed: () {
              updateProfile();
            },
            child: Text("update profile"),
          ),
          TextButton(
            onPressed: () {
              logout();
            },
            child: Text("logout"),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/screens/login.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var userObj = {};
  var _imageURL = "https://picsum.photos/200/300";
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Get.offAll(LoginScreen());
    });
  }

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
          _imageURL = userObj['imageURL'];
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

  uploadImage() async {
    var filePath = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (filePath!.path.length != 0) {
      File file = File(filePath.path);
      var storageRef = await FirebaseStorage.instance
          .ref()
          .child("uploads")
          .child(getRandomString(12))
          .putFile(file);

      var uploadedURL = await storageRef.ref.getDownloadURL();
      setState(() {
        _imageURL = uploadedURL;
      });
      FirebaseFirestore.instance
          .collection("accounts")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"imageURL": _imageURL});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(_imageURL),
              radius: 40,
            ),
          ),
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

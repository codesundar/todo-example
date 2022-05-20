import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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

  login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailCtrl.text,
      password: _passwordCtrl.text,
    )
        .then((res) {
      print(res);
      print("Login Success");
      Get.to(HomeScreen());
    }).catchError((e) {
      print(e);
    });
  }

  loginWithGoogle() async {
    // GoogleSignIn(scopes: ["email"]).signIn().then((res) {
    //   print(res!.displayName);
    // }).catchError((e){
    //   print(e);
    // });

    var account = await GoogleSignIn(scopes: ["email"]).signIn();
    var auth = await account!.authentication;
    var credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    var userRef = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userRef.user);
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
          TextField(
            controller: _passwordCtrl,
          ),
          TextButton(
            onPressed: () {
              login();
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
              loginWithGoogle();
            },
            child: Text("Login with Google"),
          ),
        ],
      ),
    );
  }
}

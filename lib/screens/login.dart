import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/auth.dart';
import 'package:todoapp/screens/register.dart';
import 'package:todoapp/screens/reset.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final AuthController _auth = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailCtrl,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required Field";
                }

                return null;
              },
            ),
            TextFormField(
              controller: _passwordCtrl,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required Field";
                }
                if (val.length < 4) {
                  return "Password must be min 4 char";
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // _auth.loginWithEmailPassword(
                  //     _emailCtrl.text, _passwordCtrl.text);
                }
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Get.to(const RegisterScreen());
              },
              child: const Text("Register"),
            ),
            TextButton(
              onPressed: () {
                Get.to(const ResetPasswordScreen());
              },
              child: const Text("Reset"),
            ),
            TextButton(
              onPressed: () {
                _auth.loginWithGoogle();
              },
              child: const Text("Login with Google"),
            ),
          ],
        ),
      ),
    );
  }
}

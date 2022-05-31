import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  // final AuthController _auth = Get.put(AuthController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              controller: _nameCtrl,
              validator: ValidationBuilder().minLength(5).build(),
            ),
            TextFormField(
              controller: _emailCtrl,
              validator: ValidationBuilder().email().minLength(5).build(),
            ),
            TextFormField(
              controller: _passwordCtrl,
              validator: ValidationBuilder().minLength(6).build(),
            ),
            TextFormField(
              controller: _mobileCtrl,
              validator: ValidationBuilder().phone().build(),
            ),
            TextButton(
              onPressed: () {
                if (_form.currentState!.validate()) {
                  print("Submit");
                  // _auth.registerWithEmailPassword({
                  //   "name": _nameCtrl.text,
                  //   "email": _emailCtrl.text,
                  //   "password": _passwordCtrl.text,
                  //   "mobile": _mobileCtrl.text
                  // });
                }
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

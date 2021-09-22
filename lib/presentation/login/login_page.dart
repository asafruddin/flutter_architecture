import 'package:flutter/material.dart';
import 'package:try_starter/utils/ui/widget/textfield_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Login'),
      TextFieldForm(controller: userController, hintText: 'Username'),
      const SizedBox(height: 10),
      TextFieldForm(controller: userController, hintText: 'Password'),
      const SizedBox(height: 10),
      ElevatedButton(onPressed: () {}, child: const Text('Login'))
    ])));
  }
}

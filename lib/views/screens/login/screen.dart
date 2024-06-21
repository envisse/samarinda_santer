import 'package:flutter/material.dart';
import 'package:samarinda_santer/views/widgets/button/button_contained.dart';
import 'package:samarinda_santer/views/widgets/text/text.dart';
import 'package:samarinda_santer/views/widgets/textfield/textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController login = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          const TextWidget(text: 'Login', textStyling: TextStyling.bodyMedium),
          const SizedBox(height: 20),
          TextFieldWidget(controller: login, hintText: 'Username',),
          const SizedBox(height: 10),
          TextFieldWidget(controller: password, obsecureText: true, hintText: 'Password',),
          const SizedBox(height: 30),
          ButtonContainedWidget(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              label: 'Login')
        ],
      ),
    );
  }
}

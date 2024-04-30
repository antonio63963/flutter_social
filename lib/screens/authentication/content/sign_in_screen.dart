import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/screens/authentication/widgets/email_input.dart';
import 'package:social/screens/authentication/widgets/password_input.dart';
import 'package:social/utils/validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errMsg;
  bool obscurePassword = true;

  void toggleHidePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          EmailInput(
            emailController: emailController,
            errMsg: _errMsg,
          ),
          const SizedBox(height: 20),
          PasswordInput(
            passwordController: passwordController,
            errMsg: _errMsg,
            obscurePassword: obscurePassword,
            onShowPassword: toggleHidePassword,
          )
        ],
      ),
    );
  }
}

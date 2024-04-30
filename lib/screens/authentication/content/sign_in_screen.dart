import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/components/my_text_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
              errMsg: _errMsg,
              validator: Validators.email,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: obscurePassword,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              errMsg: _errMsg,
              validator: Validators.password,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                icon: Icon(
                  obscurePassword
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/utils/validators.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final String? errMsg;
  final bool obscurePassword;
  final Function() onShowPassword;

  const PasswordInput({
    super.key,
    required this.passwordController,
    required this.errMsg,
    required this.obscurePassword,
    required this.onShowPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: MyTextField(
        controller: passwordController,
        hintText: 'Password',
        obscureText: obscurePassword,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: const Icon(CupertinoIcons.lock_fill),
        errMsg: errMsg,
        validator: Validators.password,
        suffixIcon: IconButton(
          onPressed: onShowPassword,
          icon: Icon(
            obscurePassword
                ? CupertinoIcons.eye_fill
                : CupertinoIcons.eye_slash_fill,
          ),
        ),
      ),
    );
  }
}

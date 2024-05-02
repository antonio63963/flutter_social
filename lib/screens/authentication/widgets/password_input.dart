import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/components/my_text_field.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController passwordController;
  final String? errMsg;
  final String? Function(String?) validator;
  final String? Function(String?)? onChanged;

  const PasswordInput({
    super.key,
    required this.passwordController,
    this.errMsg,
    required this.validator,
    this.onChanged,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscurePassword = true;
  void toggleHidePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: MyTextField(
        controller: widget.passwordController,
        hintText: 'Password',
        obscureText: obscurePassword,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: const Icon(CupertinoIcons.lock_fill),
        errMsg: widget.errMsg,
        validator: widget.validator,
        onChanged: widget.onChanged,
        suffixIcon: IconButton(
          onPressed: toggleHidePassword,
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

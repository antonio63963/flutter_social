import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/utils/validators.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final String? errMsg;
  const EmailInput({
    super.key,
    required this.emailController,
    this.errMsg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: MyTextField(
        controller: emailController,
        hintText: 'Email',
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: const Icon(CupertinoIcons.mail_solid),
        errMsg: errMsg,
        validator: Validators.email,
      ),
    );
  }
}

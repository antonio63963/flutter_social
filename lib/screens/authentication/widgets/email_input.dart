import 'package:flutter/cupertino.dart';
import 'package:social/components/my_text_field.dart';
import 'package:social/utils/validators.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final String? errMsg;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  const EmailInput({
    super.key,
    required this.emailController,
    this.errMsg,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: SizedBox(
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
      ),
    );
  }
}

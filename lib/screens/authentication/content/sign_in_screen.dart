import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/components/primary_button.dart';
import 'package:social/screens/authentication/widgets/email_input.dart';
import 'package:social/screens/authentication/widgets/password_input.dart';
import 'package:social/utils/validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errMsg;
  bool isSignInRequired = false;

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
            SignInRequired(
              emailController.text,
              passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
            if (state is SignInSuccess) {
          setState(() {
            isSignInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            isSignInRequired = true;
          });
        } else if (state is SignInFailure) {
          return;
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailInput(
              emailController: emailController,
              errMsg: _errMsg,
              paddingTop: 30,
            ),
            PasswordInput(
              passwordController: passwordController,
              errMsg: _errMsg,
              validator: Validators.password,
              paddingTop: 20,
              paddingBottom: 30,
            ),
            !isSignInRequired
                ? PrimaryButton(onPressed: onSubmit, text: "Sign In")
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

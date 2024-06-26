import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:social/components/primary_button.dart';
import 'package:social/screens/authentication/widgets/email_input.dart';
import 'package:social/screens/authentication/widgets/name_input.dart';
import 'package:social/screens/authentication/widgets/password_input.dart';
import 'package:social/screens/authentication/widgets/password_rules_section.dart';
import 'package:social/utils/validators.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool obscurePassword = false;
  bool signUpRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  String? validatePasswordRules(String? val) {
    if (val!.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        containsUpperCase = true;
      });
    } else {
      setState(() {
        containsUpperCase = false;
      });
    }
    if (val.contains(RegExp(r'[a-z]'))) {
      setState(() {
        containsLowerCase = true;
      });
    } else {
      setState(() {
        containsLowerCase = false;
      });
    }
    if (val.contains(RegExp(r'[0-9]'))) {
      setState(() {
        containsNumber = true;
      });
    } else {
      setState(() {
        containsNumber = false;
      });
    }
    if (val.contains(Validators.passwordRexExp)) {
      setState(() {
        containsSpecialChar = true;
      });
    } else {
      setState(() {
        containsSpecialChar = false;
      });
    }
    if (val.length >= 8) {
      setState(() {
        contains8Length = true;
      });
    } else {
      setState(() {
        contains8Length = false;
      });
    }
    return null;
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
        email: emailController.text,
        name: nameController.text,
      );

      setState(() {
        context
            .read<SignUpBloc>()
            .add(SignUpRequired(myUser, passwordController.text));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.i('signUp');
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              NameInput(
                nameController: nameController,
                paddingTop: 20,
                paddingBottom: 10,
              ),
              EmailInput(
                emailController: emailController,
                paddingBottom: 10,
              ),
              PasswordInput(
                passwordController: passwordController,
                onChanged: validatePasswordRules,
                validator: Validators.password,
                paddingBottom: 10,
              ),
              PasswordRulesSection(
                containsUpperCase: containsUpperCase,
                contains8Length: contains8Length,
                containsLowerCase: containsLowerCase,
                containsNumber: containsNumber,
                containsSpecialChar: containsSpecialChar,
              ),
              !signUpRequired
                  ? PrimaryButton(onPressed: onSubmit, text: "Sign Up")
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}

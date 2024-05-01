import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app_view.dart';
import 'package:social/blocs/auth_bloc/authentication_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:social/main.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.userRepository,
  });
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(
            userRepository: userRepository,
          ),
        ),
        RepositoryProvider<SignInBloc>(
          create: (_) => SignInBloc(
            userRepository: userRepository,
          ),
        ),
        RepositoryProvider<SignUpBloc>(
          create: (_) => SignUpBloc(
            userRepository: userRepository,
          ),
        ),
      ],
      child: AppView(),
    );
    // return Vs();
  }
}

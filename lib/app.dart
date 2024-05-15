import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social/app_view.dart';
import 'package:social/blocs/auth_bloc/authentication_bloc.dart';
import 'package:social/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:social/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:social/blocs/my_user_bloc/my_user_bloc.dart';
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
          create: (_) =>
              AuthenticationBloc(userRepository: GetIt.I<UserRepository>()),
        ),
        BlocProvider(
            create: (context) => CreatePostBloc(GetIt.I<PostRepository>())),
        BlocProvider(
            create: (context) => MyUserBloc(userRepository:  GetIt.I<UserRepository>())),
      ],
      child: const AppView(),
    );
  }
}

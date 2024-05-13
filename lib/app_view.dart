import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:social/blocs/auth_bloc/authentication_bloc.dart';
import 'package:social/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:social/screens/authentication/welcome_screen.dart';
import 'package:social/screens/home/home_screen.dart';
import 'package:social/themes/app_theme_light.dart';

final logger = Logger();

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social',
      theme: appThemeLight,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            logger.w('APP_VIEW: ${context.read<AuthenticationBloc>().state}');
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                BlocProvider(
                  create: (context) => UpdateUserInfoBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                  create: (context) => MyUserBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository)
                    ..add(
                      GetMyUser(
                        myUserId:
                            context.read<AuthenticationBloc>().state.user!.uid,
                      ),
                    ),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}

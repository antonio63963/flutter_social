import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/blocs/auth_bloc/authentication_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:social/screens/authentication/content/sign_in_screen.dart';
import 'package:social/screens/authentication/content/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/img/login.jpg',
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 50),
                  TabBar(
                    indicatorColor: theme.colorScheme.tertiary,
                    controller: tabController,
                    unselectedLabelColor:
                        theme.colorScheme.onBackground.withOpacity(.5),
                    labelColor: theme.colorScheme.onBackground,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        BlocProvider<SignInBloc>(
                          create: (context) => SignInBloc(
                            userRepository: context
                                .read<AuthenticationBloc>()
                                .userRepository,
                          ),
                          child: const SignInScreen(),
                        ),
                        BlocProvider<SignUpBloc>(
                          create: (context) => SignUpBloc(
                            userRepository: context
                                .read<AuthenticationBloc>()
                                .userRepository,
                          ),
                          child: const SignUpScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

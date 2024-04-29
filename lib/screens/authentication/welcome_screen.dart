import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                    Text('Welcome', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 28)),
                    TabBar(
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
                        children: [
                          Container(
                              child: Center(
                            child: Icon(Icons.abc_sharp),
                          )),
                          Container(
                              child: Center(
                            child: Icon(Icons.wine_bar_outlined),
                          )),
                        ],
                        controller: tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

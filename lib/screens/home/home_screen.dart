import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/components/post_card/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(child: Icon(CupertinoIcons.person),),
              const SizedBox(width: 10),
              const Text('Welcome Name')
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => context.read<SignInBloc>().add(
                    const SignOutRequired(),
                  ),
              icon: Icon(
                CupertinoIcons.square_arrow_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (_, index) {
            return const PostCard(
              userName: 'userName',
              date: '23-03-2024',
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis ipsum ac sem imperdiet tincidunt. Aenean eget lectus vestibulum, malesuada arcu eu, porta dolor. Donec ut velit elementum sem dapibus lobortis a vitae urna. Donec bibendum orci nec nulla luctus, ut sollicitudin augue lobortis. Proin sollicitudin in mi vel placerat. Praesent venenatis vel est vel lobortis. Ut viverra elit felis. Donec id elit lobortis quam sollicitudin volutpat. Sed vulputate vitae nulla sit amet dignissim. Donec ut varius enim, nec maximus libero. Quisque sit amet nisi sem. Suspendisse pretium nisl at rutrum malesuada. Aenean ut enim mattis velit mattis laoreet. Phasellus ac ullamcorper tellus.',
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(
            CupertinoIcons.add,
          ),
        ),
      ),
    );
  }
}

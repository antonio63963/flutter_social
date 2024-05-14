import 'package:flutter/material.dart';
import 'package:social/components/fab.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          appBar: AppBar(
            title: const Text('Create a post'),
            elevation: 0,
            backgroundColor: theme.colorScheme.background,
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  // minLines: 1,
                  maxLines: 10,
                  maxLength: 500,
                  decoration: InputDecoration(
                    hintText: 'Enter your post here...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: theme.colorScheme.onBackground),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )),
          ),
          floatingActionButton: Fab(onFab: () {}),
        ),
      ),
    );
  }
}

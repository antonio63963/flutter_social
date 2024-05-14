import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social/app_view.dart';
import 'package:social/components/fab.dart';
import 'package:user_repository/user_repository.dart';

class PostScreen extends StatefulWidget {
  final MyUser myUser;
  const PostScreen({super.key, required this.myUser});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Post post;

  @override
  void initState() {
    post = Post.empty;
    // post.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    logger.i('PostScreen: ${post.toString()}');
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
                      borderSide:
                          BorderSide(color: theme.colorScheme.onBackground),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                )),
          ),
          floatingActionButton: Fab(onFab: () {}, icon: CupertinoIcons.add),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:post_repository/post_repository.dart';
import 'package:social/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:social/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:social/components/fab.dart';
import 'package:social/utils/validators.dart';
import 'package:user_repository/user_repository.dart';

final logger = Logger();

class PostScreen extends StatefulWidget {
  final MyUser myUser;
  const PostScreen({super.key, required this.myUser});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Post post;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();

  void onSubmit(BuildContext context) {
    print('SUBMIT+++++++');
    if (_formKey.currentState!.validate()) {
      context.read<CreatePostBloc>().add(
            CreatePost(
              postText: _postController.text,
              myUser: widget.myUser,
            ),
          );
    }
  }

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: Validators.post,
                    controller: _postController,
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
                  ),
                )),
          ),
          floatingActionButton: BlocBuilder<CreatePostBloc, CreatePostState>(
            builder: (context, state) {
              return Fab(
                  onFab: () => onSubmit(context), icon: CupertinoIcons.add);
            },
          ),
        ),
      ),
    );
  }
}

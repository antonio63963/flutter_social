import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:social/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:social/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:social/components/fab.dart';
import 'package:social/components/post_card/post_card.dart';
import 'package:social/screens/home/post_screen.dart';
import 'package:user_repository/user_repository.dart';

final logger = Logger();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getAvatar(MyUserState state) {
    logger.w('Picture: ${state.user!.picture}');
    return state.user!.picture != ''
        ? Icon(
            CupertinoIcons.person,
            color: Colors.grey.shade500,
          )
        : Image.network(
            state.user!.picture!,
            fit: BoxFit.cover,
          );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<GetPostsBloc>().add(GetPosts());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
        listener: (context, state) {
          if (state is UploadPictureSuccess) {
            setState(() {
              context.read<MyUserBloc>().state.user!.picture = state.userImage;
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<MyUserBloc, MyUserState>(
              builder: (context, state) {
                if (state.status == MyUserStatus.success) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                            maxHeight: 500,
                            maxWidth: 500,
                            imageQuality: 40,
                          );
                          if (image != null) {
                            CroppedFile? croppedFile =
                                await ImageCropper().cropImage(
                              sourcePath: image.path,
                              aspectRatio: const CropAspectRatio(
                                ratioX: 1,
                                ratioY: 1,
                              ),
                              aspectRatioPresets: [
                                CropAspectRatioPreset.square
                              ],
                              uiSettings: [
                                AndroidUiSettings(
                                  toolbarTitle: 'Cropped',
                                  toolbarColor: theme.colorScheme.primary,
                                  toolbarWidgetColor: Colors.white,
                                  initAspectRatio:
                                      CropAspectRatioPreset.original,
                                  lockAspectRatio: false,
                                ),
                                IOSUiSettings(
                                  title: 'Cropped',
                                )
                              ],
                            );
                            if (croppedFile != null) {
                              setState(() {
                                context.read<UpdateUserInfoBloc>().add(
                                      UploadPicture(
                                        file: croppedFile.path,
                                        userId: context
                                            .read<MyUserBloc>()
                                            .state
                                            .user!
                                            .id,
                                      ),
                                    );
                              });
                            }
                          }
                        },
                        child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade300,
                            child: getAvatar(state)),
                      ),
                      const SizedBox(width: 10),
                      Text(state.user!.name)
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
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
          body: BlocBuilder<GetPostsBloc, GetPostsState>(
            builder: (context, state) {
              logger.i("STATE_GET_POST: ${state.toString()}");
              if (state == GetPostsLoading()) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetPostsFailure) {
                logger.e('ERROR_GET_POSTS: ${state.message}');
                return AlertDialog(
                  title: Text("Failure"),
                  content: Container(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                );
              } else if (state is GetPostsSuccess) {
                return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (_, idx) {
                      final postData = state.posts[idx];
                      final userData = postData.myUser;
                      return PostCard(
                        userName: userData.name,
                        date: '34343434',
                        // postData.createAt.toIso8601String(),
                        text: postData.post,
                      );
                    });
              } else {
                return Text('HZ');
              }
            },
          ),
          floatingActionButton: BlocBuilder<MyUserBloc, MyUserState>(
            builder: (context, state) {
              logger.w('FAB home screen: ${state.user}');
              if (state.status == MyUserStatus.success) {
                return Fab(
                  onFab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => PostScreen(
                          myUser: state.user!,
                        ),
                      ),
                    );
                  },
                  icon: CupertinoIcons.add,
                );
              } else {
                return const Fab(
                  onFab: null,
                  icon: CupertinoIcons.clear,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

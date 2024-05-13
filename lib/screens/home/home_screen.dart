import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:social/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:social/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:social/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:social/components/post_card/post_card.dart';
import 'package:user_repository/user_repository.dart';

final logger = Logger();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          child: state.user!.picture == '' ||
                                  state.user!.picture == null
                              ? Icon(
                                  CupertinoIcons.person,
                                  color: Colors.grey.shade500,
                                )
                              : Image.network(
                                  state.user!.picture!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('Welcome Name')
                    ],
                  );
                } else {
                  return SizedBox();
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
      ),
    );
  }
}

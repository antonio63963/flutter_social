part of 'create_post_bloc.dart';

sealed class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class CreatePost extends CreatePostEvent {
  final String postText;
  final MyUser myUser;

  const CreatePost({required this.postText, required this.myUser});
}

part of 'get_post_bloc.dart';

sealed class GetPostsEvent extends Equatable {
  const GetPostsEvent();

  @override
  List<Object> get props => [];
}

class GetPosts extends GetPostsEvent {}

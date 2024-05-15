part of 'get_post_bloc.dart';

sealed class GetPostsState extends Equatable {
  // final List<Post>? posts;

  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class GetPostInitial extends GetPostsState {}

final class GetPostsFailure extends GetPostsState {
  final String message;
  const GetPostsFailure(this.message);
}

final class GetPostsLoading extends GetPostsState {}

final class GetPostsSuccess extends GetPostsState {
  final List<Post> posts;
  const GetPostsSuccess(this.posts);
  
}

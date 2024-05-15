import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

final logger = Logger();

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final PostRepository _postRepository;
  CreatePostBloc(PostRepository postRepository)
      : _postRepository = postRepository,
        super(CreatePostInitial()) {
    on<CreatePost>((event, emit) async {
      emit(CreatePostLoading());
      try {
        final post = await _postRepository.createPost(
          postText: event.postText,
          myUser: event.myUser,
        );
        emit(CreatePostSuccess(post));
      } catch (e) {
        emit(CreatePostFailure());
      }
    });
  }
}

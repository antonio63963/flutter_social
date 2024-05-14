import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'get_post_event.dart';
part 'get_post_state.dart';

class GetPostBloc extends Bloc<GetPostsEvent, GetPostsState> {
  final PostRepository _postRepository;
  GetPostBloc(PostRepository postRepository)
      : _postRepository = postRepository,
        super(GetPostInitial()) {
    on<GetPosts>((event, emit) async {
      emit(GetPostsLoading());
      try {
        final List<Post> posts = await _postRepository.getPostsList();
        emit(GetPostsSuccess(posts));
      } catch (e) {
        emit(GetPostsFailure(e.toString()));
      }
    });
  }
}

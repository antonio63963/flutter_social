import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

abstract class PostRepository {
  Future<Post> createPost({required String postText, required MyUser myUser});
  Future<List<Post>> getPostsList();
}

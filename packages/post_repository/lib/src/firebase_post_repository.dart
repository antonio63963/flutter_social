import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

import 'post_repo.dart';

class FirebasePostRepository implements PostRepository {
  final postsCollection = FirebaseFirestore.instance.collection('posts');
  @override
  Future<Post> createPost(
      {required String postText, required MyUser myUser}) async {
    try {
      final id = const Uuid().v1();
      final post = Post(
        id: id,
        post: postText,
        createAt: DateTime.now(),
        myUser: myUser,
      );

    final resp =  await postsCollection.doc(post.id).set(
            post.toEntity().toDocument(),
          );
      print('FIREBASE_REPO_CREATE_: ${post.toString()}');
      return post;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPostsList() async {
    try {
      return postsCollection.get().then(
            (value) => value.docs
                .map((d) => Post.fromEntity(PostEntity.fromDocument(d.data())))
                .toList(),
          );
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }
}

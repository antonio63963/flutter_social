import 'package:post_repository/src/entities/entities.dart';
import 'package:user_repository/user_repository.dart';

class Post {
  String id;
  String post;
  DateTime createAt;
  MyUser myUser;
  Post({
    required this.id,
    required this.post,
    required this.createAt,
    required this.myUser,
  });

  static Post empty = Post(
    id: '',
    post: '',
    createAt: DateTime.now(),
    myUser: MyUser.empty,
  );

  Post copyWith({
    String? id,
    String? post,
    DateTime? createAt,
    MyUser? myUser,
  }) =>
      Post(
        id: id ?? this.id,
        post: post ?? this.post,
        createAt: createAt ?? this.createAt,
        myUser: myUser ?? this.myUser,
      );

  bool get isEmpty => this == Post.empty;
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() => PostEntity(
        id: id,
        post: post,
        createAt: createAt,
        myUser: myUser,
      );

  static Post fromEntity(PostEntity entity) => Post(
        id: entity.id,
        post: entity.post,
        createAt: entity.createAt,
        myUser: entity.myUser,
      );

  @override
  String toString() => '''
    Post: {
      id: $id,
      post: $post,
      createAt: $createAt,
      myUser: ${myUser.toString()},
    }
  ''';
}

import 'package:user_repository/user_repository.dart';

class PostEntity {
  final String id;
  final String post;
  final DateTime createAt;
  final MyUser myUser;

  const PostEntity({
    required this.id,
    required this.post,
    required this.createAt,
    required this.myUser,
  });

  Map<String, Object?> toDocument() => {
        'id': id,
        'post': post,
        'createAt': createAt,
        'myUser': myUser.toEntity().toDocument(),
      };

  static PostEntity fromDocument(Map<String, Object?> doc) => PostEntity(
        id: doc['id'] as String,
        post: doc['post'] as String,
        createAt: DateTime.parse(doc['createAt'] as String),
        myUser: MyUser.fromEntity(MyUserEntity.fromDocument(doc['myUser'] as Map<String, Object?>)),
      );

  @override
  List<Object?> get props => [id, post, createAt, myUser];

  @override
  String toString() => '''
    UserEntity: {
      id: $id,
      post: $post,
      createAt: $createAt,
      myUser: $myUser,
    }
  ''';
}
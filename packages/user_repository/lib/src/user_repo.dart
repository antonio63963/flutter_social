import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);
  Future<void> setUserData(MyUser user);
  Future<MyUser> getMyUser(String id);
  Stream<User?> get user;
}

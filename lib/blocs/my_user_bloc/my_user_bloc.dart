import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social/blocs/auth_bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository _userRepository;

  MyUserBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(const MyUserState.loading()) {
    on<GetMyUser>((event, emit) async {
      try {
        logger.i('GET USER ID: ${event.myUserId}');
        MyUser myUser = await _userRepository.getMyUser(event.myUserId);
        logger.i('MY_USER_BLOC_GET: ${myUser.toString()}');
        emit(MyUserState.success(myUser));
      } catch (err) {
        logger.e('ERRR MY_USER_BLOC_GET: $err');
        emit(const MyUserState.failure());
      }
    });
  }
}

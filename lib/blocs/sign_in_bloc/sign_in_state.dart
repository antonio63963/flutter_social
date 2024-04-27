part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String? message;
  SignInFailure({this.message});
}

class SignInProcess extends SignInState {}

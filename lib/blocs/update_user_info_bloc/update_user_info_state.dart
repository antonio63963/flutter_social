part of 'update_user_info_bloc.dart';

sealed class UpdateUserInfoState extends Equatable {
  const UpdateUserInfoState();

  @override
  List<Object> get props => [];
}

final class UpdateUserInfoInitial extends UpdateUserInfoState {}

final class UploadPictureFailure extends UpdateUserInfoState {}

final class UploadPictureLoading extends UpdateUserInfoState {}

final class UploadPictureSuccess extends UpdateUserInfoState {
  final String userImage;
  const UploadPictureSuccess(this.userImage);

  @override
  List<Object> get props => [userImage];
}

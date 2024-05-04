part of 'update_user_info_bloc.dart';

sealed class UpdateUserInfoEvent extends Equatable {
  const UpdateUserInfoEvent();

  @override
  List<Object> get props => [];
}

class UploadPicture extends UpdateUserInfoEvent {
  final String file;
  final String userId;

  const UploadPicture({required this.file, required this.userId});

  @override
  List<Object> get props => [file, userId];
}

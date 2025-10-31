import 'package:equatable/equatable.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/user_model.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserModel> users;
  final bool hasNextPage;

  const UserListLoaded({required this.users, required this.hasNextPage});

  @override
  List<Object?> get props => [users, hasNextPage];
}

class UserListNoMoreData extends UserListState {}

class UserListError extends UserListState {
  final String message;

  const UserListError({required this.message});

  @override
  List<Object?> get props => [message];
}

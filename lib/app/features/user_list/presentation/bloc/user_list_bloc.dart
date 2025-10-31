import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/user_model.dart';
import 'package:users_pagination_task/app/features/user_list/domain/usecases/user_date_usecase.dart';
import 'package:users_pagination_task/environment.dart';

import 'user_list_event.dart';
import 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserDateUseCase userListDataUseCase;

  UserListBloc({required this.userListDataUseCase}) : super(UserListInitial()) {
    on<FetchUserListEvent>(_onFetchUserList);
    on<RefreshUserListEvent>(_onRefreshUserList);
    on<SearchUserListEvent>(_onSearchUserList);
  }
  int _skip = 0;
  final int _limit = Environment.LIMIT_PER_PAGE;
  bool _hasNextPage = true;
  final List<UserModel> _usersList = [];

  Future<void> _onFetchUserList(
    FetchUserListEvent event,
    Emitter<UserListState> emit,
  ) async {
    try {
      if (!_hasNextPage) return;

      if (_skip == 0) {
        emit(UserListLoading());
      }

      // Fetch data using skip and limit
      final response = await userListDataUseCase(skip: _skip, limit: _limit);

      if (response.users.isEmpty) {
        if (_skip == 0) {
          emit(UserListNoMoreData());
        } else {
          _hasNextPage = false;
          emit(UserListLoaded(users: _usersList, hasNextPage: false));
        }
        return;
      }

      // Add new users
      _usersList.addAll(response.users);
      // Update skip and hasNextPage from response
      _skip = response.nextSkip;
      _hasNextPage = response.hasNextPage;

      emit(UserListLoaded(users: List.from(_usersList), hasNextPage: _hasNextPage));
    } catch (e) {
      emit(UserListError(message: e.toString()));
    }
  }

  Future<void> _onRefreshUserList(
    RefreshUserListEvent event,
    Emitter<UserListState> emit,
  ) async {
    // reset pagination
    _skip = 0;
    _hasNextPage = true;
    _usersList.clear();

    emit(UserListLoading());
    add(const FetchUserListEvent());
  }

  Future<void> _onSearchUserList(
    SearchUserListEvent event,
    Emitter<UserListState> emit,
  ) async {
    final rawQuery = event.query.trim().toLowerCase();
    final query = rawQuery.replaceAll(RegExp(r'\s+'), ' ');

    if (query.isEmpty) {
      emit(UserListLoaded(users: _usersList, hasNextPage: _hasNextPage));
      return;
    }

    final sanitizedPattern = RegExp.escape(query);
    final regex = RegExp(sanitizedPattern, caseSensitive: false);

    final filteredUsers = _usersList.where((user) {
      final fullName = user.fullName.toLowerCase();
      final email = user.email.toLowerCase();
      return regex.hasMatch(fullName) || regex.hasMatch(email);
    }).toList();

    emit(UserListLoaded(users: filteredUsers, hasNextPage: false));
  }
}

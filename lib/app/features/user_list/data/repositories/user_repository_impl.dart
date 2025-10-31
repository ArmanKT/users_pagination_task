import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:users_pagination_task/app/core/exceptions/exceptions.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';
import 'package:users_pagination_task/app/features/user_list/data/datasources/users_list_local_data_source.dart';
import 'package:users_pagination_task/app/features/user_list/data/datasources/users_list_remote_data_source.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/users_list_response_model.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersListRemoteDataSource usersListRemoteDataSource;
  final UsersListLocalDataSource usersListLocalDataSource;
  final Connectivity connectivity;

  UserRepositoryImpl({
    required this.usersListRemoteDataSource,
    required this.usersListLocalDataSource,
    required this.connectivity,
  });

  @override
  Future<UserListResponseModel> getUsers({
    required int skip,
    required int limit,
  }) async {
    final connectivityResult = await connectivity.checkConnectivity();
    final hasInternet = !connectivityResult.contains(ConnectivityResult.none);

    if (hasInternet) {
      try {
        // Fetch from remote
        final remoteData = await usersListRemoteDataSource.getUsers(skip: skip, limit: limit);

        // Clear cache if first page
        if (skip == 0) {
          await usersListLocalDataSource.clearUserList();
        }

        // Cache new data
        await usersListLocalDataSource.cacheUsersList(remoteData.users);

        return remoteData;
      } catch (_) {
        // fallback to cache if remote fails
        return _getCachedUsersOrThrow();
      }
    } else {
      // No internet: use cache
      return _getCachedUsersOrThrow();
    }
  }

  Future<UserListResponseModel> _getCachedUsersOrThrow() async {
    final cachedUsers = usersListLocalDataSource.getCachedUsersList();
    if (cachedUsers.isNotEmpty) {
      return UserListResponseModel(users: cachedUsers);
    } else {
      throw ServerException(AppStrings.noInternet);
    }
  }
}

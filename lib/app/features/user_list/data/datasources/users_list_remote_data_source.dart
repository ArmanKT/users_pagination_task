import 'dart:convert';

import 'package:users_pagination_task/app/core/exceptions/exceptions.dart';
import 'package:users_pagination_task/app/core/network/api_client.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/users_list_response_model.dart';

abstract class UsersListRemoteDataSource {
  Future<UserListResponseModel> getUsers({required int skip, required int limit});
}

class UsersListRemoteDataSourceImpl implements UsersListRemoteDataSource {
  final ApiClient apiClient;

  UsersListRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserListResponseModel> getUsers({required int skip, required int limit}) async {
    try {
      final response = await apiClient.get(UrlContainer.users, queryParameters: {'skip': skip, 'limit': limit});
      if (response.success == true) {
        return userListResponseModelFromJson(jsonEncode(response.data));
      } else {
        throw ServerException(response.error);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

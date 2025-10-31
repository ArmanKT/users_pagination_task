// To parse this JSON data, do
//
//     final userListResponseModel = userListResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:users_pagination_task/app/features/user_list/data/models/user_model.dart';

UserListResponseModel userListResponseModelFromJson(String str) => UserListResponseModel.fromJson(json.decode(str));

String userListResponseModelToJson(UserListResponseModel data) => json.encode(data.toJson());

class UserListResponseModel {
  List<UserModel> users;
  int? total;
  int? skip;
  int? limit;

  UserListResponseModel({
    required this.users,
    this.total,
    this.skip,
    this.limit,
  });

  factory UserListResponseModel.fromJson(Map<String, dynamic> json) => UserListResponseModel(
        users: List<UserModel>.from(json["users"].map((x) => UserModel.fromJson(x))),
        total: json["total"] ?? 0,
        skip: json["skip"] ?? 0,
        limit: json["limit"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };

  /// Check if there is a next page
  bool get hasNextPage => ((skip ?? 0) + (limit ?? 0)) < (total ?? 0);

  /// Get next page skip value
  int get nextSkip => (skip ?? 0) + (limit ?? 0);

  /// Get current page number (1-based)
  int get currentPage => ((skip ?? 0) / ((limit ?? 1) == 0 ? 1 : (limit ?? 1))).floor() + 1;

  /// Get total number of pages
  int get totalPages => ((total ?? 0) / ((limit ?? 1) == 0 ? 1 : (limit ?? 1))).ceil();
}

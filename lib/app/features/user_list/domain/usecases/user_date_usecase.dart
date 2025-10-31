import 'package:users_pagination_task/app/features/user_list/data/models/users_list_response_model.dart';
import 'package:users_pagination_task/app/features/user_list/domain/repositories/user_repository.dart';

class UserDateUseCase {
  final UserRepository userRepository;
  UserDateUseCase({required this.userRepository});

  Future<UserListResponseModel> call({required int skip, required int limit}) {
    return userRepository.getUsers(skip: skip, limit: limit);
  }
}

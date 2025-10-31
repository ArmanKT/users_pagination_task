import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_pagination_task/app/features/user_list/domain/repositories/user_repository.dart';
import 'package:users_pagination_task/app/features/user_list/domain/usecases/user_date_usecase.dart';
import 'package:users_pagination_task/app/features/user_list/data/models/users_list_response_model.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserDateUseCase useCase;
  late MockUserRepository mockRepo;

  setUp(() {
    mockRepo = MockUserRepository();
    useCase = UserDateUseCase(userRepository: mockRepo);
  });

  test('should call repository and return data', () async {
    final response = UserListResponseModel(users: []);

    when(() => mockRepo.getUsers(skip: 0, limit: 10)).thenAnswer((_) async => response);

    final result = await useCase.call(skip: 0, limit: 10);

    expect(result, response);
    verify(() => mockRepo.getUsers(skip: 0, limit: 10)).called(1);
  });

  test('should forward exceptions thrown by repository', () async {
    when(() => mockRepo.getUsers(skip: 0, limit: 10)).thenThrow(Exception('fail'));

    expect(() => useCase.call(skip: 0, limit: 10), throwsA(isA<Exception>()));
  });
}

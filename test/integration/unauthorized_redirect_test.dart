import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_pagination_task/app/core/network/interceptor/unauthorized_interceptor.dart';
import 'package:users_pagination_task/app/features/auth/presentation/login_screen.dart';
import 'package:users_pagination_task/app/router/app_router.dart';
import 'package:users_pagination_task/app/router/route_helper.dart';

/// Mock for the handler required by Interceptor.onError
class MockErrorInterceptorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  setUpAll(() {
    // Register the handler mock for mocktail
    registerFallbackValue(MockErrorInterceptorHandler());
    registerFallbackValue(DioException(requestOptions: RequestOptions(path: '')));
  });

  testWidgets('UnauthorizedInterceptor redirects to LoginScreen on 403 (Unit Test)', (tester) async {
    final navigatorKey = AppRouter.navigatorKey;

    // 1. Setup GoRouter
    final router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Home'))),
        ),
        GoRoute(
          path: '/${RouteHelper.loginScreen}',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );

    // Pump MaterialApp with router (renders 'Home' initially)
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    // Initial rendering check
    await tester.pump();
    expect(find.text('Home'), findsOneWidget);

    // Mocks for direct interceptor call
    final mockHandler = MockErrorInterceptorHandler();
    final unauthorizedInterceptor = UnauthorizedInterceptor();

    // Create a mock 403 response and exception
    final response403 = Response(
      statusCode: 403,
      requestOptions: RequestOptions(path: '/test'),
      data: {'message': 'Unauthorized'},
    );
    final exception403 = DioException(
      requestOptions: RequestOptions(path: '/test'),
      response: response403,
      type: DioExceptionType.badResponse,
    );

    // Directly call the interceptor's onError method
    unauthorizedInterceptor.onError(exception403, mockHandler);

    // We need to pump once to let the context.go() take effect (microtask phase)
    await tester.pump();
    // Then, let the navigation animation complete
    await tester.pumpAndSettle();

    expect(find.text("Email"), findsOneWidget);

    // Verify that the handler was called to continue the error propagation
    verify(() => mockHandler.next(exception403)).called(1);
  });
}

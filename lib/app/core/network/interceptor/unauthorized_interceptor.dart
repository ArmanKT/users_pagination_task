import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:users_pagination_task/app/router/app_router.dart';
import 'package:users_pagination_task/app/router/route_helper.dart';

/// Interceptor to handle 403 Unauthorized responses globally
class UnauthorizedInterceptor extends Interceptor {
  UnauthorizedInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Check if status code is 403
    if (err.response?.statusCode == 403) {
      // Redirect to LoginScreen and remove all previous routes
      if (AppRouter.navigatorKey.currentContext != null) {
        AppRouter.navigatorKey.currentContext?.go(RouteHelper.loginScreen);
      }
    }

    // Continue to propagate other errors
    handler.next(err);
  }
}

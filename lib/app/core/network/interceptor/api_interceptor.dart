import 'package:dio/dio.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printI('Response: ${response.statusCode}');
    printI('Response Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      printE('Error: ${err.response?.statusCode} ${err.message}');
      printE('Response data: ${err.response?.data}');
    }
    handler.next(err);
  }
}

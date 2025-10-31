class ServerException implements Exception {
  final String? message;
  ServerException([this.message]);
  @override
  String toString() => message ?? '';
}

class CacheException implements Exception {
  final String message;
  CacheException({this.message = 'Cache error occurred'});
}

class NetworkException implements Exception {
  final String message;
  NetworkException({this.message = 'Network error occurred'});
}

class UnauthorizedException extends ServerException {
  UnauthorizedException([String? message])
      : super(message ?? 'Unauthorized request');
}

class ServerException implements Exception {
  final String? message;
  ServerException({this.message});
}

class DBException implements Exception {
  final String? message;
  DBException({this.message});
}

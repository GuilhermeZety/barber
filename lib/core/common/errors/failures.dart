import 'package:equatable/equatable.dart';

//Modelo padrão para erros futuros
class Failure extends Equatable {
  final String title;
  final String? description;

  @override
  List<Object?> get props => [title, description];

  const Failure({required this.title, this.description});
}

//General Failures
class ServerFailure extends Failure {
  const ServerFailure({required super.title, super.description});
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.title, super.description});
}

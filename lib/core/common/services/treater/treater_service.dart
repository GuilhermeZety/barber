import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:barber/core/common/errors/exceptions.dart';
import 'package:barber/core/common/errors/failures.dart';
import 'package:barber/core/common/services/connection/connection_service_impl.dart';

class TreaterService {
  Future<Either<Failure, T>> call<T>(
    Future<T> Function() code, {
    String? errorIdentification,
    bool online = false,
  }) async {
    if (await ConnectionServiceImpl().isConnected || !online) {
      try {
        return Right(await code());
      } on Failure catch (e) {
        log(e.toString());
        return Left(e);
      } catch (e) {
        log(e.toString());
        if (e is DioException) {
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.response?.data['message'],
            ),
          );
        }
        if (e is ServerException) {
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        if (e is DBException) {
          return Left(
            DatabaseFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        return Left(
          Failure(
            title: '$errorIdentification',
            description: e.toString(),
          ),
        );
      }
    } else {
      return const Left(Failure(title: 'Sem conexão com a internet'));
    }
  }
}

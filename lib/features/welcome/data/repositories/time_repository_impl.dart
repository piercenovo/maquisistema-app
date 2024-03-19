import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_exception.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/core/network/connection_checker.dart';
import 'package:maquisistema_app/core/utils/date_utils.dart';
import 'package:maquisistema_app/features/welcome/data/datasources/time_remote_datasource.dart';
import 'package:maquisistema_app/features/welcome/data/models/time_model.dart';
import 'package:maquisistema_app/features/welcome/domain/repositories/time_repository.dart';

class TimeRepositoryImpl implements TimeRepository {
  final TimeRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;

  const TimeRepositoryImpl({
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Future<Either<ServerFailure, TimeModel>> getTime() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final TimeModel time = getTimeModel();
        return Right(time);
      }
      final TimeModel time = await remoteDataSource.getTime();
      return Right(time);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';

abstract class TimeRepository {
  Future<Either<Failure, TimeEntity>> getTime();
}

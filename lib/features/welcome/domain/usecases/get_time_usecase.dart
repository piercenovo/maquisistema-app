import 'package:dartz/dartz.dart';
import 'package:maquisistema_app/core/errors/server_failure.dart';
import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';
import 'package:maquisistema_app/features/welcome/domain/repositories/time_repository.dart';

class GetTimeUseCase {
  final TimeRepository repository;

  GetTimeUseCase({required this.repository});

  Future<Either<Failure, TimeEntity>> call() async {
    return await repository.getTime();
  }
}

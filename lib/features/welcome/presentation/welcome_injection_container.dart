import 'package:maquisistema_app/core/di/injection_container.dart';
import 'package:maquisistema_app/features/welcome/data/datasources/time_remote_datasource.dart';
import 'package:maquisistema_app/features/welcome/data/datasources/time_remote_datasource_impl.dart';
import 'package:maquisistema_app/features/welcome/data/repositories/time_repository_impl.dart';
import 'package:maquisistema_app/features/welcome/domain/repositories/time_repository.dart';
import 'package:maquisistema_app/features/welcome/domain/usecases/get_time_usecase.dart';
import 'package:maquisistema_app/features/welcome/presentation/cubits/time_cubit.dart';

Future<void> welcomeInjectionContainer() async {
  // Cubits
  sl.registerFactory<TimeCubit>(
    () => TimeCubit(getTimeUseCase: sl.call()),
  );

  // Use cases
  sl.registerLazySingleton<GetTimeUseCase>(
    () => GetTimeUseCase(repository: sl.call()),
  );

  // Repositories
  sl.registerLazySingleton<TimeRepository>(
    () => TimeRepositoryImpl(
        remoteDataSource: sl.call(), connectionChecker: sl.call()),
  );

  // Data sources
  sl.registerLazySingleton<TimeRemoteDataSource>(
    () => TimeRemoteDataSourceImpl(client: sl.call()),
  );
}

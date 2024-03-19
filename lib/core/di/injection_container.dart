// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:maquisistema_app/core/network/connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory<ConnectionChecker>(() => ConnectionCheckerImpl(sl()));
}

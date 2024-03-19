import 'package:maquisistema_app/features/welcome/data/models/time_model.dart';

abstract class TimeRemoteDataSource {
  Future<TimeModel> getTime();
}

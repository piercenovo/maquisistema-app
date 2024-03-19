import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';
import 'package:maquisistema_app/features/welcome/domain/usecases/get_time_usecase.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  final GetTimeUseCase getTimeUseCase;

  TimeCubit({required this.getTimeUseCase}) : super(TimeInitial());

  Future<void> getTime() async {
    emit(TimeLoading());
    final failureOrTime = await getTimeUseCase();
    failureOrTime.fold(
        (failure) => emit(TimeFailure(error: failure.toString())),
        (time) => emit(TimeLoaded(time)));
  }
}

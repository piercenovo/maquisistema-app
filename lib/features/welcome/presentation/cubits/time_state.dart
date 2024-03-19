part of 'time_cubit.dart';

abstract class TimeState extends Equatable {
  const TimeState();
}

class TimeInitial extends TimeState {
  @override
  List<Object> get props => [];
}

class TimeLoading extends TimeState {
  @override
  List<Object> get props => [];
}

class TimeLoaded extends TimeState {
  final TimeEntity time;

  const TimeLoaded(this.time);

  @override
  List<Object> get props => [time];
}

class TimeFailure extends TimeState {
  final String error;

  const TimeFailure({required this.error});

  @override
  List<Object> get props => [error];
}

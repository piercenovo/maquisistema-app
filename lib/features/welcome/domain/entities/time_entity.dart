import 'package:equatable/equatable.dart';

class TimeEntity extends Equatable {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int seconds;
  final int milliSeconds;
  final String dateTime;
  final String date;
  final String time;
  final String timeZone;
  final String dayOfWeek;
  final bool dstActive;

  const TimeEntity({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.seconds,
    required this.milliSeconds,
    required this.dateTime,
    required this.date,
    required this.time,
    required this.timeZone,
    required this.dayOfWeek,
    required this.dstActive,
  });

  @override
  List<Object?> get props => [
        year,
        month,
        day,
        hour,
        minute,
        seconds,
        milliSeconds,
        dateTime,
        date,
        time,
        timeZone,
        dayOfWeek,
        dstActive,
      ];
}

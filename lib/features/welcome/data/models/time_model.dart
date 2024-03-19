// ignore_for_file: overridden_fields, annotate_overrides

import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';

class TimeModel extends TimeEntity {
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

  const TimeModel({
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
  }) : super(
          year: year,
          month: month,
          day: day,
          hour: hour,
          minute: minute,
          seconds: seconds,
          milliSeconds: milliSeconds,
          dateTime: dateTime,
          date: date,
          time: time,
          timeZone: timeZone,
          dayOfWeek: dayOfWeek,
          dstActive: dstActive,
        );

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        year: json["year"],
        month: json["month"],
        day: json["day"],
        hour: json["hour"],
        minute: json["minute"],
        seconds: json["seconds"],
        milliSeconds: json["milliSeconds"],
        dateTime: json["dateTime"],
        date: json["date"],
        time: json["time"],
        timeZone: json["timeZone"],
        dayOfWeek: json["dayOfWeek"],
        dstActive: json["dstActive"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
        "seconds": seconds,
        "milliSeconds": milliSeconds,
        "dateTime": dateTime,
        "date": date,
        "time": time,
        "timeZone": timeZone,
        "dayOfWeek": dayOfWeek,
        "dstActive": dstActive,
      };

  static List<TimeModel> fromJsonList(List<dynamic> jsonList) {
    return List<TimeModel>.from(jsonList.map((x) => TimeModel.fromJson(x)));
  }
}

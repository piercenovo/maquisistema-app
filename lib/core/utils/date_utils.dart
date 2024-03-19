import 'package:intl/intl.dart';
import 'package:maquisistema_app/features/welcome/data/models/time_model.dart';
import 'package:timezone/timezone.dart' as tz;

// Define la zona horaria deseada
final ztimeZone = tz.getLocation('America/Lima');

String getDateNow() {
  DateTime date = DateTime.now();

  // Convierte la fecha y hora a la zona horaria deseada
  date = tz.TZDateTime.from(date, ztimeZone);

  // Formatea la fecha en el formato deseado
  final formatInitial = DateFormat('hh:mm a').format(date);

  return formatInitial;
}

String getDateFormat(String input) {
  // Parsea las fechas originales en formato ISO 8601
  DateTime date = DateTime.parse(input);

  // Formatea la fecha en el formato deseado
  final formatInitial = DateFormat('hh:mm a').format(date);

  return formatInitial;
}

TimeModel getTimeModel() {
  // Parsea las fechas originales en formato ISO 8601
  DateTime date = DateTime.now();

  // Convierte la fecha y hora a la zona horaria deseada
  date = tz.TZDateTime.from(date, ztimeZone);

  // Formatea la fecha en el formato deseado
  final formattedDate = DateFormat('MM/dd/yyyy').format(date);
  final formattedTime = DateFormat('hh:mm').format(date);
  final formattedDay = DateFormat('EEEE').format(date);

  return TimeModel(
    year: date.year,
    month: date.month,
    day: date.day,
    hour: date.hour,
    minute: date.minute,
    seconds: date.second,
    milliSeconds: date.millisecond,
    dateTime: date.toString(),
    date: formattedDate,
    time: formattedTime,
    timeZone: ztimeZone.toString(),
    dayOfWeek: formattedDay,
    dstActive: false,
  );
}

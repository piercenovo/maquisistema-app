import 'package:intl/intl.dart';
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

  // Convierte la fecha y hora a la zona horaria deseada
  date = tz.TZDateTime.from(date, ztimeZone);

  // Formatea la fecha en el formato deseado
  final formatInitial = DateFormat('hh:mm a').format(date);

  return formatInitial;
}

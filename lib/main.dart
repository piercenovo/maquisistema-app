import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:maquisistema_app/core/app/maquisistema_app.dart';
import 'package:maquisistema_app/core/di/injection_container.dart' as di;
import 'package:timezone/data/latest.dart' as tzdata;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

// ----> Inicializa la biblioteca timezone
  tzdata.initializeTimeZones();

// ----> Inicializa GetIt
  await di.init();

  runApp(const MaquisistemaApp());
}

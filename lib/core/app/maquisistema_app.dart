import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/core/theme/theme.dart';
import 'package:maquisistema_app/features/welcome_screen.dart';

class MaquisistemaApp extends StatelessWidget {
  const MaquisistemaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maquisistema',
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: MultiBlocProvider(
        providers: const [],
        child: const WelcomeScreen(),
      ),
    );
  }
}
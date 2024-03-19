// ignore_for_file: depend_on_referenced_packages, avoid_print, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/helpers/navigator.dart';
import 'package:maquisistema_app/features/pokemos/presentation/screens/home_screen.dart';
import 'package:maquisistema_app/features/welcome/domain/entities/time_entity.dart';
import 'package:maquisistema_app/features/welcome/presentation/widgets/logo_widget.dart';
import 'package:maquisistema_app/features/welcome/presentation/widgets/time_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TimeEntity? _time;

  @override
  void initState() {
    super.initState();
    _navigateNextScreen();
  }

  Future<void> _navigateNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Espera 3 segundos

    // Navegar a la siguiente pantalla
    pushAndReplaceToPage(context, const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD9D3),
                  Color(0xFFCCFCFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const LogoWidget(),
          TimeWidget(time: _time),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maquisistema_app/core/helpers/error_message.dart';
import 'package:maquisistema_app/core/helpers/navigator.dart';

class CustomCubitConsumer<T extends Cubit> extends StatelessWidget {
  final T cubit;
  final Function? successListener;
  final Function? loadingListener;
  final Function builder;
  final Type successStateType;
  final Type? loadingStateType;
  final Type failureStateType;
  final bool goBack;
  final bool isBuildWhen;

  const CustomCubitConsumer({
    super.key,
    required this.cubit,
    this.successListener,
    this.loadingListener,
    required this.builder,
    required this.successStateType,
    this.loadingStateType,
    required this.failureStateType,
    this.goBack = false,
    this.isBuildWhen = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, dynamic>(
      bloc: cubit,
      listener: (context, state) {
        if (successListener != null) {
          if (state.runtimeType == successStateType) {
            successListener!(context, state);
          }
        }

        if (loadingListener != null) {
          if (state.runtimeType == loadingStateType) {
            loadingListener!(context, state);
          }
        }
        if (state.runtimeType == failureStateType) {
          _handleFailureState(context, state);
        }
      },
      buildWhen: isBuildWhen
          ? (context, state) => state.runtimeType == successStateType
          : null,
      builder: (context, state) {
        return builder(context, state);
      },
    );
  }

  void _handleFailureState(BuildContext context, dynamic state) {
    goBack ? popBack(context) : null;
    errorMessageSnack(context, (state as dynamic).error);
  }
}

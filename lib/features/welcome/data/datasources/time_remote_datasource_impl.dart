// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:maquisistema_app/core/constants/api_paths.dart';
import 'package:maquisistema_app/core/errors/server_exception.dart';
import 'package:maquisistema_app/features/welcome/data/datasources/time_remote_datasource.dart';
import 'package:maquisistema_app/features/welcome/data/models/time_model.dart';
import 'package:http/http.dart' as http;

class TimeRemoteDataSourceImpl implements TimeRemoteDataSource {
  final http.Client client;

  TimeRemoteDataSourceImpl({required this.client});

  @override
  Future<TimeModel> getTime() async {
    final response = await client.get(
      Uri.parse(APIPaths.timeIoApi),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return TimeModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}

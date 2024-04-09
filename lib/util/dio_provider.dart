import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Duration defaultTimeout = Duration(seconds: 15);

final dioProvider = Provider<Dio>((ref) {
  BaseOptions options = BaseOptions(
    connectTimeout: defaultTimeout,
    receiveTimeout: defaultTimeout,
    sendTimeout: defaultTimeout,
    baseUrl: 'https://api.restful-api.dev/',
  );

  final dio = Dio(options);

  return dio;
});

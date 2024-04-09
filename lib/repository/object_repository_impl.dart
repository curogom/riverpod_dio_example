import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dio_example/model/model_object.dart';
import 'package:riverpod_dio_example/repository/object_repository.dart';
import 'package:riverpod_dio_example/util/dio_provider.dart';

final objectRepositoryProvider = Provider.autoDispose<ObjectRepository>((ref) {
  final dio = ref.read(dioProvider);

  return _ObjectRepositoryImpl(dio);
});


class _ObjectRepositoryImpl with ObjectRepository {
  final Dio _dio;

  _ObjectRepositoryImpl(this._dio);

  @override
  Future<List<ModelObject>> getObjects() async {
    final response = await _dio.get('/objects');
    final List<dynamic> data = response.data;
    return data.map((json) => ModelObject.fromMap(json)).toList();
  }

  @override
  Future<ModelObject> getObjectById(int id) async {
    final response = await _dio.get('/objects/$id');
    final data = response.data;
    return ModelObject.fromMap(data);
  }
}
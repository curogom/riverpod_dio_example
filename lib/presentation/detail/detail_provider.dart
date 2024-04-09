import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dio_example/model/model_object.dart';
import 'package:riverpod_dio_example/repository/object_repository_impl.dart';

final detailScreenProvider = FutureProvider.family<ModelObject, int>((ref, id) async {
  final repository = ref.read(objectRepositoryProvider);
  final data = await repository.getObjectById(id);

  return data;
});

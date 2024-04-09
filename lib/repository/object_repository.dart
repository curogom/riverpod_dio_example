import 'package:riverpod_dio_example/model/model_object.dart';

mixin ObjectRepository {
  Future<List<ModelObject>> getObjects();
  Future<ModelObject> getObjectById(int id);
}
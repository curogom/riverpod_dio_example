class ModelObject {
  final String id;
  final String name;
  final Map<String, Object?>? data;

  const ModelObject({
    required this.id,
    required this.name,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'data': data,
    };
  }

  factory ModelObject.fromMap(Map<String, dynamic> map) {
    return ModelObject(
      id: map['id'] as String,
      name: map['name'] as String,
      data: map['data'] as Map<String, Object?>?,
    );
  }

  @override
  String toString() {
    return 'ModelObject{id: $id, name: $name, data: $data}';
  }
}
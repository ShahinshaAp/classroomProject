// Define a model for a single classroomModel
class ClassroomModel {
  final int id;
  final String layout;
  final String name;
  final int size;

  ClassroomModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  // Factory method to create a ClassroomModel from JSON
  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return ClassroomModel(
      id: json['id'],
      layout: json['layout'],
      name: json['name'],
      size: json['size'],
    );
  }

  // Convert a ClassroomModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'layout': layout,
      'name': name,
      'size': size,
    };
  }
}

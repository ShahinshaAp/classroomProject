class StudentModel {
  final int id;
  final String name;
  final int age;
  final String email;

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  // Factory method to create a StudentModel from JSON
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  // Convert a StudentModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
    };
  }
}

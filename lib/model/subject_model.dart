class SubjectModel {
  final int id;
  final String name;
  final int credits;
  final String teacher;

  SubjectModel({
    required this.id,
    required this.name,
    required this.credits,
    required this.teacher,
  });

  // Factory method to create a SubjectModel from JSON
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      credits: json['credits'],
      teacher: json['teacher'],
    );
  }

  // Convert a SubjectModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credits': credits,
      'teacher': teacher,
    };
  }
}

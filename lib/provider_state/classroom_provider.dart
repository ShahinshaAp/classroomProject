import 'package:classroom_project/model/student_model.dart';
import 'package:classroom_project/model/subject_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:classroom_project/model/classroom_model.dart';
import 'package:classroom_project/services/api_services.dart';

class ClassroomProvider with ChangeNotifier {
  List<ClassroomModel> _classrooms = [];
  List<StudentModel> _students = [];
  List<SubjectModel> _subject = [];
  bool _isLoading = false;
  SubjectModel? _selectedSubject;
  SubjectModel? get selectedSubject => _selectedSubject;
  StudentModel? _selectedStudent;
  StudentModel? get selectedStudent => _selectedStudent;

  List<ClassroomModel> get classrooms => _classrooms;
  List<StudentModel> get students => _students;
  List<SubjectModel> get subject => _subject;
  bool get isLoading => _isLoading;

  Future<void> fetchClassrooms() async {
    _isLoading = true;
    notifyListeners(); 

    try {
      final fetchedClassrooms = await ApiService().fetchClassrooms();
      _classrooms = fetchedClassrooms;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> fetchStudent() async {
    _isLoading = true;
    notifyListeners();

    try {
      final fetchedStudents = await ApiService().fetchStudents();
      _students = fetchedStudents;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
    Future<void> fetchSubject() async {
    _isLoading = true;
    notifyListeners(); 

    try {
      final fetchedSubject = await ApiService().fetchSubjects();
      _subject = fetchedSubject;
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
   void setSelectedSubject(SubjectModel? subject) {
    _selectedSubject = subject;
    notifyListeners();
  }
   void setSelectedStudent(StudentModel? students) {
    _selectedStudent = students;
    notifyListeners();
  }
  void removeSelectedStudent() {
    _selectedStudent = null;
    notifyListeners();
  }
   void removeSelectedSubject() {
    _selectedSubject = null;
    notifyListeners();
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:classroom_project/model/classroom_model.dart';
import 'package:classroom_project/model/student_model.dart';
import 'package:classroom_project/model/subject_model.dart';
import 'package:classroom_project/services/api_endpoints.dart';
import 'package:classroom_project/services/global_error_handling.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://nibrahim.pythonanywhere.com/';
  static const String _apiKey = '94a0b';

  Future<List<ClassroomModel>> fetchClassrooms() async {
    const String url = '$_baseUrl${ApiEndpoints.classroom}?api_key=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('Response data: ${data['classrooms']}'); 
       
        List<dynamic> classroomsJson = data['classrooms'];
        List<ClassroomModel> classrooms = classroomsJson
            .map((json) => ClassroomModel.fromJson(json))
            .toList();
        return classrooms;
      } else {
          
        throw Exception('Failed to load classrooms');
      }
    } catch (e) {
       GlobalErrorHandler.showError("$e"); 
      throw Exception('Error: $e');
    }
  }
  Future<List<StudentModel>> fetchStudents() async {
   const String url = '$_baseUrl${ApiEndpoints.student}?api_key=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('Response data: ${data['students']}'); 

        
        List<dynamic> studentsJson = data['students'];
        List<StudentModel> students = studentsJson
            .map((json) => StudentModel.fromJson(json))
            .toList();
        return students;
      } else {
       
        throw Exception('Failed to load students');
      }
    } catch (e) {
        GlobalErrorHandler.showError("$e"); 
      throw Exception('Error: $e');
    }
  }
  Future<List<SubjectModel>> fetchSubjects() async {
   const String url = '$_baseUrl${ApiEndpoints.subject}?api_key=$_apiKey';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('Response data: ${data['subjects']}'); 

     
        List<dynamic> subjectsJson = data['subjects'];
        List<SubjectModel> subjects = subjectsJson
            .map((json) => SubjectModel.fromJson(json))
            .toList();
        return subjects;
      } else {
        throw Exception('Failed to load subjects');
      }
    } catch (e) {
        GlobalErrorHandler.showError("$e"); 
      throw Exception('Error: $e');
    }
  }
}

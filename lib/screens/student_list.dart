

import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/details_screen.dart';
import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class StudentListScreen extends StatefulWidget {
  final bool? studentreturn;
  const StudentListScreen({super.key, this.studentreturn});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> { @override
  void initState() {
    super.initState();
  
      WidgetsBinding.instance.addPostFrameCallback((_) {
           Provider.of<ClassroomProvider>(context, listen: false).fetchStudent();
       });
 
  }

  @override
  Widget build(BuildContext context) {
       final classroomProvider = Provider.of<ClassroomProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CustomImageView(
            imagePath: ImageConstant.back,
          height: 5.h,
            width: 9.w,
            color: Colors.black,
          ),
        ),
      ),
      body:  classroomProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Students',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
          Expanded(child: ListView.builder(
            physics: BouncingScrollPhysics(),
             itemCount: classroomProvider.students.length,
            
            itemBuilder:(context, index){
            final students = classroomProvider.students[index];
            
            return  GestureDetector(
              onTap: () {
                if(widget.studentreturn == true){
                 classroomProvider.setSelectedStudent(students);
                      Navigator.pop(context);
                } else{
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailScreen(
                          mainTitle: "Student Detail",
                          title: students.name,
                          subtitle: "Age : ${ students.age}",
                          trailing: students.email,
                          imagePath: "https://www.lingayasvidyapeeth.edu.in/sanmax/wp-content/uploads/2023/07/studentlife.webp",
                        ),
                      ));
                }
              },
              child: DetailCard(
                title: students.name,
                student: true,
                subtitle: students.email,
                count: students.age,
                countTitle: "Age",
              ),
            );
          }))
        ],
      ),
    );
  }
}



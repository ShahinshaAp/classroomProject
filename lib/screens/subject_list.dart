

import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/details_screen.dart';
import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SubjectListScreen extends StatefulWidget {
  final bool? subjectreturn;
  const SubjectListScreen({super.key, this.subjectreturn});

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  void initState() {
    super.initState();
  
      WidgetsBinding.instance.addPostFrameCallback((_) {
           Provider.of<ClassroomProvider>(context, listen: false).fetchSubject();
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
              'Subjects',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
          Expanded(child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: classroomProvider.subject.length,
            
            itemBuilder:(context, index){
             final subject = classroomProvider.subject[index];
            return  GestureDetector(
              onTap: () {
                if(widget.subjectreturn == true){
                 classroomProvider.setSelectedSubject(subject);
                      Navigator.pop(context);
                } else{
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailScreen(
                          mainTitle: "Subject Detail",
                          title: subject.name,
                          trailing: "Credit : ${ subject.credits}",
                          subtitle: subject.teacher,
                          imagePath: "https://www.lingayasvidyapeeth.edu.in/sanmax/wp-content/uploads/2023/07/studentlife.webp",
                        ),
                      ));
                }
                 
              },
              child: DetailCard(
                title: subject.name,
                student:false,
                subtitle: subject.teacher,
                count: subject.credits,
                countTitle: "Credit",
              ),
            );
          }))
        ],
      ),
    );
  }
}



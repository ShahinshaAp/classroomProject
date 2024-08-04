import 'package:classroom_project/model/subject_model.dart';
import 'package:classroom_project/provider_state/classroom_provider.dart';
import 'package:classroom_project/screens/student_list.dart';
import 'package:classroom_project/screens/subject_list.dart';
import 'package:classroom_project/utils/color_set.dart';
import 'package:classroom_project/utils/custom_image_view.dart';
import 'package:classroom_project/utils/image_constant.dart';
import 'package:classroom_project/widgets/conference_table.dart';
import 'package:classroom_project/widgets/custom_elavated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ClasroomDetail extends StatefulWidget {
  final String? mainTitle;
  final String? classType;

  const ClasroomDetail({super.key, this.mainTitle, this.classType});

  @override
  State<ClasroomDetail> createState() => _ClasroomDetailState();
}

class _ClasroomDetailState extends State<ClasroomDetail> {
   void initState() {
    super.initState();
    // Fetch classrooms data when the widget is initialized
      WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClassroomProvider>(context, listen: false).removeSelectedStudent();
      Provider.of<ClassroomProvider>(context, listen: false).removeSelectedSubject();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.mainTitle ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyLightolor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  classroomProvider.selectedSubject != null
                      ? Expanded(
                          child: ListTile(
                            title: Text(
                              classroomProvider.selectedSubject?.name ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp),
                            ),
                            subtitle: Text(
                              classroomProvider.selectedSubject?.teacher ?? "",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Add Subject",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14.sp),
                          ),
                        ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SubjectListScreen(
                                  subjectreturn: true,
                                ),
                              ),
                            );
                          },
                          text: classroomProvider.selectedSubject != null ? "Change" : "Add",
                          height: 4.h,
                          width: 26.w,
                          borderRadius: 5,
                          buttonStyle: ButtonStyle(
                            textStyle: WidgetStateProperty.all(
                              const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(greenColor),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          classroomProvider.selectedSubject != null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyLightolor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  classroomProvider.selectedStudent != null
                      ? Expanded(
                          child: ListTile(
                            title: Text(
                              classroomProvider.selectedStudent?.name ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp),
                            ),
                            subtitle: Text(
                              classroomProvider.selectedStudent?.email ?? "",
                              style: TextStyle(fontSize: 9.sp),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Add Student",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14.sp),
                          ),
                        ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const StudentListScreen(
                                  studentreturn: true,
                                ),
                              ),
                            );
                          },
                          text: classroomProvider.selectedStudent != null ? "Change" : "Add",
                          height: 4.h,
                          width: 26.w,
                          borderRadius: 5,
                          buttonStyle: ButtonStyle(
                            textStyle: WidgetStateProperty.all(
                              const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(greenColor),
                            foregroundColor:
                                WidgetStateProperty.all(Colors.green),
                          ),
                        ),
                      ),
                      classroomProvider.selectedStudent != null ?
                      IconButton(onPressed: (){
                        classroomProvider.removeSelectedStudent();
                      }, icon: const Icon(Icons.delete, color: Colors.red,))
                       : Container()
                    ],
                  )
                ],
              ),
            ),
          ) : Container(),
          widget.classType == "classroom" ?
         Flexible(child: 
          CustomImageView(
          imagePath: ImageConstant.classroom ,                                             
           ),
         ) : ConferenceTable()
         

        ],
      ),
    );
  }
}


